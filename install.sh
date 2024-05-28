#!/usr/bin/env zsh

if [[ $(uname) == "Darwin" ]]; then
  brew install coreutils zsh neovim
  default write -g ApplePressAndHoldEnabled -bool false
  defaults write -g InitialKeyRepeat -int 10
  defaults write -g KeyRepeat -int 1
fi

if [ ! -f $HOME/.oh-my-zsh ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

rm ~/.tmux.conf || true
ln -s $PWD/tmux.conf $HOME/.tmux.conf 
rm -r ~/.config/alacritty || true
mkdir ~/.config/alacritty
ln -s $PWD/alacritty.yml $HOME/.config/alacritty/alacritty.yml
rm -rf ~/.config/nvim || true
# ln -s $PWD/nvim $HOME/.config/nvim
ln -s $PWD/nvim $HOME/.config/nvim
rm -r ~/.ideavimrc || true
ln -s $PWD/ideavimrc $HOME/.ideavimrc
rm ~/.wezterm.lua || true
ln -s $PWD/wezterm.lua $HOME/.wezterm.lua

while ! grep "zshrc-custom" $HOME/.zshrc > /dev/null; do
  echo "\nsource $PWD/zshrc-custom" >> $HOME/.zshrc; 
done

source $HOME/.zshrc
