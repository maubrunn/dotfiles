#!/bin/bash

config_dir=~/.config
dotfile_dir=$(pwd)

if ! [ -d $config_dir ]; then
	mkdir $config_dir
fi

read -p "Do you want to install tmux stuff? [Y/n] " response

if [[ "$response" == "Y" || "$response" == "y" || "$response" == "" ]]; then
	echo "Tmux stuff"
	if ! [ -d ~/scripts ]; then
		mkdir ~/scripts
	fi
	ln -s $dotfile_dir/tmux_prompt.zsh ~/scripts/tmux_prompt.zsh
	ln -s $dotfile_dir/.tmux.conf ~/.tmux.conf 
fi

read -p "Do you want to install vim stuff? [Y/n] " response
if [[ "$response" == "Y" || "$response" == "y" || "$response" == "" ]]; then
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	ln -s ~/repos/dotfiles/.vimrc ~/.vimrc
fi

read -p "Do you want to install the neovim stuff? [Y/n] " response

if [[ "$response" == "Y" || "$response" == "y" || "$response" ==  "" ]]; then
	echo "neovim stuff"
	nvim_dir=$config_dir/nvim
	if ! [ -d $nvim_dir ]; then
		mkdir $nvim_dir
	fi
	ln -s $dotfile_dir/init.lua $nvim_dir/init.lua
fi
