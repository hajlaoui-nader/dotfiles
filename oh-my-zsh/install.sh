#!/bin/bash
export ZSH=~/.oh-my-zsh

echo "installing oh-my-zsh"
if [ ! -d $ZSH ]; then
  git clone https://github.com/robbyrussell/oh-my-zsh.git $ZSH
fi

echo "installing oh-my-zsh navigation tools"
# navigation tools
x = ~/.config/znt/zsh-navigation-tools
if [ ! -d  x ]; then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/psprint/zsh-navigation-tools/master/doc/install.sh)"
else echo 'error downloading zsh znt navigation tools'
fi

ZSH_THEME_DIR=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
if [ ! -d "$ZSH_THEME_DIR" ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_THEME_DIR"
fi