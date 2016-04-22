#!/bin/zsh
mkdir -p ~/.vim-swap
mkdir -p ~/.vim-tmp
mkdir -p ~/.ssh
chmod 755 ~/.ssh

ln -sf `pwd`/.gitconfig ~/.gitconfig
ln -sf `pwd`/.vimrc ~/.vimrc
ln -sf `pwd`/.zprofile ~/.zprofile
ln -sf `pwd`/.ssh/config ~/.ssh/config
sudo ln -sf `pwd`/etc/zshrc /etc/zshrc
sudo chmod 444 /etc/zshrc

source ~/.zprofile
