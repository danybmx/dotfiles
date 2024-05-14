#!/usr/bin/env zsh

rm ~/.tmux.conf || true
ln -s $PWD/tmux.conf $HOME/.tmux.conf 
rm -r ~/.config/alacritty || true
mkdir ~/.config/alacritty
ln -s $PWD/alacritty.yml $HOME/.config/alacritty/alacritty.yml
rm -rf ~/.config/nvim || true
# ln -s $PWD/nvim $HOME/.config/nvim
ln -s $PWD/nvim-astro $HOME/.config/nvim
rm -r ~/.ideavimrc || true
ln -s $PWD/ideavimrc $HOME/.ideavimrc
rm ~/.wezterm.lua || true
ln -s $PWD/wezterm.lua $HOME/.wezterm.lua

while ! grep "zshrc-custom" $HOME/.zshrc > /dev/null; do
  echo "\nsource $PWD/zshrc-custom" >> $HOME/.zshrc; 
done

source $HOME/.zshrc
