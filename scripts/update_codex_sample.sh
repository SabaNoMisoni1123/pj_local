#!/usr/bin/env sh
set -eu

usage() {
  cat <<'EOF'
Usage:
  scripts/update_codex_sample.sh [--force] <project-root>

Description:
  .codex-sample の標準コピー対象で、指定したプロジェクトルートの
  Codex 運用環境を更新します。

Update policy:
  - AGENTS.md, .codex/config.toml, .agents/, domains_ja/, operating_ja/,
    templates/ は .codex-sample の内容で置き換えます。
    これらの管理対象で .codex-sample から廃止されたファイルは削除します。
  - project-local/ は案件固有情報を含み得るため、既存なら更新しません。
    存在しない場合だけ空テンプレートとしてコピーします。
  - README.md が雛形と同一なら更新します。既存 README.md が別内容なら、
    codex_setup_README.md を更新または作成します。
  - --force 指定時も project-local/ は置き換えず、README.md だけ強制的に
    置き換えます。
EOF
}

log() {
  printf '%s\n' "$1"
}

require_target_child() {
  path=$1

  case "$path" in
    "$target_root"/*)
      ;;
    *)
      printf 'Error: refusing to modify path outside target root: %s\n' "$path" >&2
      exit 1
      ;;
  esac
}

remove_managed_path_if_exists() {
  path=$1
  label=$2
  reason=$3

  if [ ! -e "$path" ]; then
    return
  fi

  require_target_child "$path"
  rm -rf "$path"
  log "[remove] $label: $reason: $path"
}

replace_file() {
  src=$1
  dest=$2
  label=$3

  require_target_child "$dest"

  if [ ! -f "$src" ]; then
    remove_managed_path_if_exists "$dest" "$label" "source retired"
    return
  fi

  if [ -d "$dest" ]; then
    remove_managed_path_if_exists "$dest" "$label" "replace directory with file"
  fi

  parent=$(dirname "$dest")
  mkdir -p "$parent"
  cp "$src" "$dest"
  log "[update] $label: $dest"
}

replace_dir() {
  src=$1
  dest=$2
  label=$3

  require_target_child "$dest"

  if [ ! -d "$src" ]; then
    remove_managed_path_if_exists "$dest" "$label" "source retired"
    return
  fi

  parent=$(dirname "$dest")
  mkdir -p "$parent"
  if [ -e "$dest" ]; then
    rm -rf "$dest"
  fi
  cp -R "$src" "$dest"
  log "[update] $label: $dest"
}

copy_dir_if_absent() {
  src=$1
  dest=$2
  label=$3

  require_target_child "$dest"

  if [ ! -d "$src" ]; then
    log "[skip] $label: source not found and existing project-local data is preserved: $dest"
    return
  fi

  if [ -e "$dest" ]; then
    log "[skip] $label: preserve existing project-local data: $dest"
    return
  fi

  parent=$(dirname "$dest")
  mkdir -p "$parent"
  cp -R "$src" "$dest"
  log "[copy] $label: $dest"
}

remove_codex_dir_if_empty() {
  codex_dir="$target_root/.codex"

  if [ -d "$codex_dir" ] && ! find "$codex_dir" -mindepth 1 -print -quit | grep . >/dev/null 2>&1; then
    require_target_child "$codex_dir"
    rmdir "$codex_dir"
    log "[remove] .codex: empty directory removed: $codex_dir"
  fi
}

force=0
target_arg=

while [ "$#" -gt 0 ]; do
  case "$1" in
    -h|--help)
      usage
      exit 0
      ;;
    --force)
      force=1
      ;;
    -*)
      printf 'Error: unknown option: %s\n' "$1" >&2
      usage
      exit 2
      ;;
    *)
      if [ -n "$target_arg" ]; then
        usage
        exit 2
      fi
      target_arg=$1
      ;;
  esac
  shift
done

if [ -z "$target_arg" ]; then
  usage
  exit 2
fi

script_dir=$(CDPATH= cd "$(dirname "$0")" && pwd -P)
repo_root=$(CDPATH= cd "$script_dir/.." && pwd -P)
sample_dir="$repo_root/.codex-sample"
codex_config_template="$sample_dir/codex_config_template.toml"

if [ ! -d "$sample_dir" ]; then
  printf 'Error: .codex-sample not found: %s\n' "$sample_dir" >&2
  exit 1
fi

target_root=$target_arg
mkdir -p "$target_root"
target_root=$(CDPATH= cd "$target_root" && pwd -P)

log "Source: $sample_dir"
log "Target: $target_root"
if [ "$force" -eq 1 ]; then
  log "Mode: force (README.md will be replaced; project-local/ is preserved)"
fi

replace_file "$sample_dir/AGENTS.md" "$target_root/AGENTS.md" "AGENTS.md"
replace_dir "$sample_dir/.agents" "$target_root/.agents" ".agents"
replace_file "$codex_config_template" "$target_root/.codex/config.toml" ".codex/config.toml"
replace_dir "$sample_dir/domains_ja" "$target_root/domains_ja" "domains_ja"
replace_dir "$sample_dir/operating_ja" "$target_root/operating_ja" "operating_ja"
replace_dir "$sample_dir/templates" "$target_root/templates" "templates"
copy_dir_if_absent "$sample_dir/project-local" "$target_root/project-local" "project-local"

if [ "$force" -eq 1 ]; then
  if [ -f "$sample_dir/README.md" ]; then
    replace_file "$sample_dir/README.md" "$target_root/README.md" "README.md"
    remove_managed_path_if_exists "$target_root/codex_setup_README.md" "codex_setup_README.md" "superseded by forced README.md update"
  else
    remove_managed_path_if_exists "$target_root/codex_setup_README.md" "codex_setup_README.md" "source retired"
    log "[skip] README.md: source not found and project README is preserved: $target_root/README.md"
  fi
elif [ ! -f "$sample_dir/README.md" ]; then
  remove_managed_path_if_exists "$target_root/codex_setup_README.md" "codex_setup_README.md" "source retired"
  log "[skip] README.md: source not found and project README is preserved: $target_root/README.md"
elif [ ! -e "$target_root/README.md" ]; then
  replace_file "$sample_dir/README.md" "$target_root/README.md" "README.md"
elif cmp -s "$sample_dir/README.md" "$target_root/README.md"; then
  replace_file "$sample_dir/README.md" "$target_root/README.md" "README.md"
else
  replace_file "$sample_dir/README.md" "$target_root/codex_setup_README.md" "codex_setup_README.md"
fi

remove_codex_dir_if_empty
log "Done."
