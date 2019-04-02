#!/usr/bin/env bash

set -e
[ -n "MYVIMRC_DEBUG" ] && set -x

wget https://raw.githubusercontent.com/DelightRun/myvimrc/master/vimrc -O ~/.vimrc
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall
