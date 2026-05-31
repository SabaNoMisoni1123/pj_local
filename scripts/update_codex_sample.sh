#!/usr/bin/env sh
set -eu

usage() {
  cat <<'EOF'
Usage:
  scripts/update_codex_sample.sh <project-root>

Description:
  .codex-sample の標準コピー対象で、指定したプロジェクトルートの
  Codex 運用環境を更新します。

Update policy:
  - AGENTS.md, .codex/config.toml, .agents/, domains_ja/, operating_ja/,
    templates/ は .codex-sample の内容で置き換えます。
  - project-local/ は案件固有情報を含み得るため、既存なら更新しません。
    存在しない場合だけ空テンプレートとしてコピーします。
  - README.md が雛形と同一なら更新します。既存 README.md が別内容なら、
    codex_setup_README.md を更新または作成します。
EOF
}

log() {
  printf '%s\n' "$1"
}

replace_file() {
  src=$1
  dest=$2
  label=$3

  parent=$(dirname "$dest")
  mkdir -p "$parent"
  cp "$src" "$dest"
  log "[update] $label: $dest"
}

replace_dir() {
  src=$1
  dest=$2
  label=$3

  parent=$(dirname "$dest")
  mkdir -p "$parent"
  rm -rf "$dest"
  cp -R "$src" "$dest"
  log "[update] $label: $dest"
}

copy_dir_if_absent() {
  src=$1
  dest=$2
  label=$3

  if [ -e "$dest" ]; then
    log "[skip] $label: preserve existing project-local data: $dest"
    return
  fi

  parent=$(dirname "$dest")
  mkdir -p "$parent"
  cp -R "$src" "$dest"
  log "[copy] $label: $dest"
}

if [ "$#" -ne 1 ]; then
  usage
  exit 2
fi

case "$1" in
  -h|--help)
    usage
    exit 0
    ;;
esac

script_dir=$(CDPATH= cd "$(dirname "$0")" && pwd -P)
repo_root=$(CDPATH= cd "$script_dir/.." && pwd -P)
sample_dir="$repo_root/.codex-sample"

if [ ! -d "$sample_dir" ]; then
  printf 'Error: .codex-sample not found: %s\n' "$sample_dir" >&2
  exit 1
fi

target_root=$1
mkdir -p "$target_root"
target_root=$(CDPATH= cd "$target_root" && pwd -P)

log "Source: $sample_dir"
log "Target: $target_root"

replace_file "$sample_dir/AGENTS.md" "$target_root/AGENTS.md" "AGENTS.md"
replace_dir "$sample_dir/.agents" "$target_root/.agents" ".agents"
replace_file "$sample_dir/config.toml" "$target_root/.codex/config.toml" ".codex/config.toml"
replace_dir "$sample_dir/domains_ja" "$target_root/domains_ja" "domains_ja"
replace_dir "$sample_dir/operating_ja" "$target_root/operating_ja" "operating_ja"
replace_dir "$sample_dir/templates" "$target_root/templates" "templates"
copy_dir_if_absent "$sample_dir/project-local" "$target_root/project-local" "project-local"

if [ ! -e "$target_root/README.md" ]; then
  replace_file "$sample_dir/README.md" "$target_root/README.md" "README.md"
elif cmp -s "$sample_dir/README.md" "$target_root/README.md"; then
  replace_file "$sample_dir/README.md" "$target_root/README.md" "README.md"
else
  replace_file "$sample_dir/README.md" "$target_root/codex_setup_README.md" "codex_setup_README.md"
fi

log "Done."
