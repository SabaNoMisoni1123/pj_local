#!/usr/bin/env sh
set -eu

usage() {
  cat <<'EOF'
Usage:
  scripts/uninstall_codex_sample.sh <project-root>

Description:
  指定したプロジェクトルートから、.codex-sample 由来の Codex 運用環境を
  削除します。削除以外の処理は行いません。

Removal policy:
  - .agents/, domains_ja/, operating_ja/, templates/, codex_setup_README.md
    は存在すれば削除します。
  - AGENTS.md, .codex/config.toml, README.md は .codex-sample の雛形と
    同一内容の場合だけ削除します。
  - project-local/ は .codex-sample の空テンプレートと完全一致する場合だけ
    削除します。案件固有情報が入っている場合は削除しません。
EOF
}

log() {
  printf '%s\n' "$1"
}

remove_path_if_exists() {
  path=$1
  label=$2

  if [ ! -e "$path" ]; then
    log "[skip] $label: not found: $path"
    return
  fi

  rm -rf "$path"
  log "[remove] $label: $path"
}

remove_file_if_same() {
  sample=$1
  path=$2
  label=$3

  if [ ! -e "$path" ]; then
    log "[skip] $label: not found: $path"
    return
  fi

  if cmp -s "$sample" "$path"; then
    rm -f "$path"
    log "[remove] $label: $path"
  else
    log "[skip] $label: differs from sample: $path"
  fi
}

remove_dir_if_same() {
  sample=$1
  path=$2
  label=$3

  if [ ! -e "$path" ]; then
    log "[skip] $label: not found: $path"
    return
  fi

  if diff -qr "$sample" "$path" >/dev/null 2>&1; then
    rm -rf "$path"
    log "[remove] $label: $path"
  else
    log "[skip] $label: differs from sample: $path"
  fi
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

if [ ! -d "$1" ]; then
  printf 'Error: project root not found: %s\n' "$1" >&2
  exit 1
fi

target_root=$(CDPATH= cd "$1" && pwd -P)

log "Source: $sample_dir"
log "Target: $target_root"

remove_file_if_same "$sample_dir/AGENTS.md" "$target_root/AGENTS.md" "AGENTS.md"
remove_path_if_exists "$target_root/.agents" ".agents"
remove_file_if_same "$sample_dir/config.toml" "$target_root/.codex/config.toml" ".codex/config.toml"
remove_path_if_exists "$target_root/domains_ja" "domains_ja"
remove_path_if_exists "$target_root/operating_ja" "operating_ja"
remove_path_if_exists "$target_root/templates" "templates"
remove_dir_if_same "$sample_dir/project-local" "$target_root/project-local" "project-local"
remove_file_if_same "$sample_dir/README.md" "$target_root/README.md" "README.md"
remove_path_if_exists "$target_root/codex_setup_README.md" "codex_setup_README.md"

if [ -d "$target_root/.codex" ] && ! find "$target_root/.codex" -mindepth 1 -print -quit | grep . >/dev/null 2>&1; then
  rmdir "$target_root/.codex"
  log "[remove] .codex: empty directory removed: $target_root/.codex"
fi

log "Done."
