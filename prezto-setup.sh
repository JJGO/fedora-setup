#!/usr/bin/env zsh

set -e 			# Exit on error
set -o pipefail # Exit on pipe error
set -x 			# Enable verbosity

# Install prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  if [ -f "${ZDOTDIR:-$HOME}/.${rcfile:t}" ]; then
      mv "${ZDOTDIR:-$HOME}/.${rcfile:t}" "${ZDOTDIR:-$HOME}/.${rcfile:t}.bk"
  fi
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# Install https://github.com/supercrabtree/k
mkdir -p "$HOME/bin/k"
git clone https://github.com/supercrabtree/k $HOME/bin/k
