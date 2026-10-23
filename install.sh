#!/usr/bin/env bash

set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Symlink $1 to $2, backing up anything that is already there
link() {
  local src="$1" dest="$2"
  if [ "$(readlink "$dest" 2>/dev/null)" = "$src" ]; then
    return
  fi
  if [ -e "$dest" ] || [ -L "$dest" ]; then
    mv "$dest" "$dest.backup.$(date +%Y%m%d%H%M%S)"
  fi
  ln -s "$src" "$dest"
}

# Homebrew
if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$HOME/.zprofile"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Dotfiles
link "$DIR/.config" "$HOME/.config"
link "$DIR/.zshrc" "$HOME/.zshrc"

# Homebrew packages
brew update
brew bundle --file "$DIR/Brewfile"

# Git: per-machine identity
if [ ! -f "$HOME/.gitconfig" ]; then
  read -rp "Work email for git: " work_email
  sed "s|YOUR_WORK_EMAIL|$work_email|" "$DIR/templates/gitconfig.local.example" > "$HOME/.gitconfig"
fi

# SSH: host aliases and keys
mkdir -p "$HOME/.ssh"
chmod 700 "$HOME/.ssh"
if [ ! -f "$HOME/.ssh/config" ]; then
  cp "$DIR/templates/ssh_config.example" "$HOME/.ssh/config"
fi

for key in id_ed25519 id_ed25519_work; do
  if [ ! -f "$HOME/.ssh/$key" ]; then
    ssh-keygen -t ed25519 -f "$HOME/.ssh/$key" -C "$key@$(hostname -s)"
    echo "→ Add this key to GitHub:"
    cat "$HOME/.ssh/$key.pub"
  fi
done

# Checks
github_user() {
  local out
  out="$(ssh -o StrictHostKeyChecking=accept-new -T "git@$1" 2>&1 || true)"
  if [[ $out =~ Hi\ ([^!]+)! ]]; then
    echo "${BASH_REMATCH[1]}"
  fi
}
private_user="$(github_user github-private)"
work_user="$(github_user github-work)"
echo "github-private → ${private_user:-⚠ not authenticated}"
echo "github-work    → ${work_user:-⚠ not authenticated}"
if [ -n "$private_user" ] && [ "$private_user" = "$work_user" ]; then
  echo "⚠ both hosts use the same GitHub account — check IdentitiesOnly in ~/.ssh/config"
fi
