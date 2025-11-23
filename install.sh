#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
BACKUP_DIR="$HOME/dotfiles_backup_$(date +%Y%m%d%H%M%S)"
TARGET="$HOME"

echo "Dotfiles dir: $DOTFILES_DIR"
echo "Backup dir:   $BACKUP_DIR"
echo

# Ensure GNU stow is installed
if ! command -v stow >/dev/null 2>&1; then
  echo "GNU stow not found."
  if command -v apt >/dev/null 2>&1; then
    sudo apt update && sudo apt install -y stow
  elif command -v yum >/dev/null 2>&1; then
    sudo yum install -y stow
  elif command -v dnf >/dev/null 2>&1; then
    sudo dnf install -y stow
  else
    echo "Please install stow manually."
    exit 1
  fi
fi

mkdir -p "$BACKUP_DIR"

# Helper: backup an existing target if it exists and is not a symlink to our repo
backup_if_exists() {
  local target="$1"
  if [ -e "$target" ] && [ ! -L "$target" ]; then
    echo "Backing up $target -> $BACKUP_DIR${target/#$HOME/}"
    mkdir -p "$(dirname "$BACKUP_DIR${target/#$HOME/}")"
    mv "$target" "$BACKUP_DIR${target/#$HOME/}"
  fi
}

# For each package (top-level directory except files), prepare backups then stow
for pkg in "$DOTFILES_DIR"/*/; do
  [ -d "$pkg" ] || continue
  pkg="$(basename "$pkg")"
  # skip hidden or helper dirs
  case "$pkg" in
  .git | .github | docs) continue ;;
  esac
  echo
  echo "Processing package: $pkg"

  # find all files in the package and compute the intended $HOME target
  while IFS= read -r -d $'\0' file; do
    # remove leading package/ prefix
    rel="${file#"$DOTFILES_DIR/$pkg/"}"
    target="$TARGET/$rel"
    backup_if_exists "$target"
  done < <(find "$DOTFILES_DIR/$pkg" -mindepth 1 -print0)

  echo "Stowing $pkg -> $TARGET"
  stow -v -R -t "$TARGET" "$pkg"
done

echo
echo "Done. If any files were moved they are in: $BACKUP_DIR"
echo "You can remove that backup later after verifying everything works."
