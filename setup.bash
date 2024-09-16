#!/bin/bash

cd ~
git clone -b vim https://github.com/uninhm/neovim-config .vim
mv .vim/init.vim ~/.vimrc
vim -c PlugInstall -c q -c q
