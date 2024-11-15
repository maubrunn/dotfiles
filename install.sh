#!/bin/bash

read -p "Do you want to install tmux stuff? [Y/n] " response

if [[ "$response" == "Y" || "$response" == "y" || "$response" == "" ]]; then
	echo "Tmux stuff"
	if ! [ -d ~/scripts ]; then
		mkdir ~/scripts
	fi
	ln -s ~/repos/dotfiles/tmux_prompt.zsh ~/scripts/tmux_prompt.zsh
	ln -s ~/repos/dotfiles/.tmux.conf ~/.tmux.conf 
fi

read -p "Do you want to install vim stuff? [Y/n] " response
if [[ "$response" == "Y" || "$response" == "y" || "$response" == "" ]]; then
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	ln -s ~/repos/dotfiles/.vimrc ~/.vimrc
fi
