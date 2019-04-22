FROM ubuntu:18.04

RUN apt update && \
	apt install -y software-properties-common && \
	add-apt-repository ppa:neovim-ppa/stable -y && \
	apt update && \
	apt install -y neovim git curl exuberant-ctags

COPY ./init.vim ~/.config/nvim/init.vim
CMD bash
