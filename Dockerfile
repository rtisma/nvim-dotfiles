FROM ubuntu:18.04

RUN apt update && \
	apt install -y software-properties-common && \
	add-apt-repository ppa:neovim-ppa/stable -y && \
	apt update && \
	apt install -y neovim git curl exuberant-ctags

RUN curl -fLo ~/.config/nvim/init.vim --create-dirs https://raw.githubusercontent.com/rtisma/nvim-dotfiles/master/init.vim
CMD bash
