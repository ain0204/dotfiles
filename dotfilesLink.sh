#!/bin/sh
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.emacs.d ~/.emacs.d

# setup oh-my-zsh
ln -sf ~/dotfiles/.zshrc ~/.zshrc
~/dotfiles/oh-my-zsh/tools/install.sh
