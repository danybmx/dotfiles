#!/usr/bin/env zsh

if [[ $(uname) == "Darwin" ]]; then
  brew install coreutils zsh neovim gnu-sed
  defaults write -g ApplePressAndHoldEnabled -bool false
  defaults write -g InitialKeyRepeat -int 15
  defaults write -g KeyRepeat -int 1
fi

if [ ! -d $HOME/.oh-my-zsh ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

rm $HOME/.oh-my-zsh/custom/themes/dpstudios.zsh-theme || true
ln -s $PWD/dpstudios.zsh-theme $HOME/.oh-my-zsh/custom/themes/dpstudios.zsh-theme
if command -v gsed; then
  gsed -i '/^ZSH_THEME/c\ZSH_THEME="dpstudios"' ~/.zshrc
else
  sed -i '/^ZSH_THEME/c\ZSH_THEME="dpstudios"' ~/.zshrc
fi

rm ~/.tmux.conf || true
ln -s $PWD/tmux.conf $HOME/.tmux.conf
rm -r ~/.config/alacritty || true
mkdir ~/.config/alacritty
ln -s $PWD/alacritty.yml $HOME/.config/alacritty/alacritty.yml
rm -rf ~/.config/nvim || true
ln -s $PWD/nvim-astro $HOME/.config/nvim
rm -r ~/.ideavimrc || true
ln -s $PWD/ideavimrc $HOME/.ideavimrc
rm ~/.wezterm.lua || true
ln -s $PWD/wezterm.lua $HOME/.wezterm.lua
rm ~/.config/zed/settings.json
ln -s $PWD/zed/settings.json ~/.config/zed/settings.json
rm ~/.config/zed/keymap.json
ln -s $PWD/zed/keymap.json ~/.config/zed/keymap.json
mkdir -p ~/.config/ghostty || true
rm ~/.config/ghostty/config || true
ln -s $PWD/ghostty/config ~/.config/ghostty/config
