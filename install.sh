#!/bin/bash


if [ -f ~/.config/nvim/init.vim ];then
	echo "The file `~/.config/nvim/init.vim` already exists. move it and re-run"
	exit 1
else
	curl -fLo ~/.config/nvim/init.vim --create-dirs https://raw.githubusercontent.com/rtisma/nvim-dotfiles/master/init.vim
fi
