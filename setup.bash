#!/usr/bin/env bash

# Install zsh
which zsh
if [ $? -eq 0 ]; then
	echo "ZSH already installed"
else
	sudo apt install zsh
fi

# Install oh-my-zsh
if [ -d ~/.oh-my-zsh ]; then
	echo "Oh my ZSH already installed"
else
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if [ $? -eq 0 ]; then
	echo "TMUX already installed"
else
	sudo apt install tmux
fi

touch ~/.personalrc

read -p "Link dotfiles. This will overwrite many of your dotfiles. Do you wish to continue? [y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
	rm -f $HOME/.zshrc
	ln -s $(pwd)/.zshrc $HOME/.zshrc

	rm -f $HOME/.tmux.conf
	ln -s $(pwd)/.tmux.conf $HOME/.tmux.conf

	rm -f $HOME/.config/nvim/init.vim
	mkdir -p $HOME/.config/nvim
	ln -s $(pwd)/init.vim $HOME/.config/nvim/init.vim

	rm -rf $HOME/.config/nvim/plugin
	mkdir -p $HOME/.config/nvim/plugin
	ln -s $(pwd)/vim-plugins-config $HOME/.config/nvim/plugin
fi
