#!/usr/bin/env sh
set -eu

usage() {
  cat <<'EOF'
Usage:
  scripts/install_codex_sample.sh <project-root>

Description:
  .codex-sample の標準コピー対象を、指定したプロジェクトルートへ配置します。
  既存ファイル・既存ディレクトリは上書きせず、スキップします。

Copy mapping:
  .codex-sample/AGENTS.md       -> <project-root>/AGENTS.md
  .codex-sample/.agents/        -> <project-root>/.agents/
  .codex-sample/config.toml     -> <project-root>/.codex/config.toml
  .codex-sample/domains_ja/     -> <project-root>/domains_ja/
  .codex-sample/operating_ja/   -> <project-root>/operating_ja/
  .codex-sample/templates/      -> <project-root>/templates/
  .codex-sample/project-local/  -> <project-root>/project-local/ 既存時はスキップ

  .codex-sample/README.md は導入説明として扱います。
  <project-root>/README.md がなければ README.md にコピーし、既存なら
  codex_setup_README.md にコピーします。いずれも既存ならスキップします。
EOF
}

log() {
  printf '%s\n' "$1"
}

copy_file_if_absent() {
  src=$1
  dest=$2
  label=$3

  if [ -e "$dest" ]; then
    log "[skip] $label: already exists: $dest"
    return
  fi

  parent=$(dirname "$dest")
  mkdir -p "$parent"
  cp "$src" "$dest"
  log "[copy] $label: $dest"
}

copy_dir_if_absent() {
  src=$1
  dest=$2
  label=$3

  if [ -e "$dest" ]; then
    log "[skip] $label: already exists: $dest"
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

copy_file_if_absent "$sample_dir/AGENTS.md" "$target_root/AGENTS.md" "AGENTS.md"
copy_dir_if_absent "$sample_dir/.agents" "$target_root/.agents" ".agents"
copy_file_if_absent "$sample_dir/config.toml" "$target_root/.codex/config.toml" ".codex/config.toml"
copy_dir_if_absent "$sample_dir/domains_ja" "$target_root/domains_ja" "domains_ja"
copy_dir_if_absent "$sample_dir/operating_ja" "$target_root/operating_ja" "operating_ja"
copy_dir_if_absent "$sample_dir/templates" "$target_root/templates" "templates"
copy_dir_if_absent "$sample_dir/project-local" "$target_root/project-local" "project-local"

if [ ! -e "$target_root/README.md" ]; then
  copy_file_if_absent "$sample_dir/README.md" "$target_root/README.md" "README.md"
elif cmp -s "$sample_dir/README.md" "$target_root/README.md"; then
  log "[skip] README.md: already installed: $target_root/README.md"
else
  copy_file_if_absent "$sample_dir/README.md" "$target_root/codex_setup_README.md" "codex_setup_README.md"
fi

log "Done."
