#!/usr/bin/bash
rm -rf ~/.danybmx-dotfiles
git clone git@github.com:danybmx/dotfiles.git ~/.danybmx-dotfiles
cd ~/.danybmx-dotfiles

rm ~/.tmux.conf || true
ln -s $PWD/tmux.conf $HOME/.tmux.conf

rm -r ~/.config/nvim || true
ln -s $PWD/nvim $HOME/.config/nvim
