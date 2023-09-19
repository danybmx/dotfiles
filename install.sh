#!/usr/bin/bash
rm ~/.tmux.conf || true
ln -s $PWD/tmux.conf $HOME/.tmux.conf 
rm -r ~/.config/alacritty || true
mkdir ~/.config/alacritty
ln -s $PWD/alacritty.yml $HOME/.config/alacritty/alacritty.yml
rm -r ~/.config/nvim || true
ln -s $PWD/nvim $HOME/.config/nvim
