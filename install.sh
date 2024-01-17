#!/usr/bin/bash
rm ~/.tmux.conf || true
ln -s $PWD/tmux.conf $HOME/.tmux.conf 
rm -r ~/.config/alacritty || true
mkdir ~/.config/alacritty
ln -s $PWD/alacritty.yml $HOME/.config/alacritty/alacritty.yml
rm -rf ~/.config/nvim || true
ln -s $PWD/nvim $HOME/.config/nvim
rm -r ~/.ideavimrc || true
ln -s $PWD/ideavimrc $HOME/.ideavimrc
rm ~/.yabairc || true
ln -s $PWD/yabairc $HOME/.yabairc
rm ~/.skhdrc|| true
ln -s $PWD/skhdrc $HOME/.skhdrc
rm -r ~/.config/spacebar || true
mkdir ~/.config/spacebar
ln -s $PWD/spacebarrc $HOME/.config/spacebar/spacebarrc
