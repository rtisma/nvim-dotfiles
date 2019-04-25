#!/bin/bash

INIT_FILE=~/.config/nvim/init.vim

if [ -f ${INIT_FILE} ];then
	echo "The file '${INIT_FILE}' already exists. move it and re-run"
	exit 1
else
	curl -fLo ${INIT_FILE} --create-dirs https://raw.githubusercontent.com/rtisma/nvim-dotfiles/master/init.vim
	nvim -c ":PlugInstall"
fi
