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