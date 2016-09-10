#!/usr/bin/env sh

################################################################################
# install
#
# This script symlinks the dotfiles into place in the home directory.
################################################################################


fancy_echo() {
  local fmt="$1"; shift

  # shellcheck disable=SC2059
  printf "\n$fmt\n" "$@"
}

set -e # Terminate script if anything exits with a non-zero value
set -u # Prevent unset variables

DOTFILES_DIR=$HOME/dotfiles

fancy_echo "Installing dotfiles..."

ln -nfs "$DOTFILES_DIR/gitconfig" "$HOME/.gitconfig"
ln -nfs "$DOTFILES_DIR/gitignore_global" "$HOME/.gitignore_global"
ln -nfs "$DOTFILES_DIR/gitmessage" "$HOME/.gitmessage"
ln -nfs "$DOTFILES_DIR/tmux.conf" "$HOME/.tmux.conf"
ln -nfs "$DOTFILES_DIR/vimrc" "$HOME/.vimrc"
ln -nfs "$DOTFILES_DIR/zshrc" "$HOME/.zshrc"

fancy_echo "Dotfiles installation complete!"
