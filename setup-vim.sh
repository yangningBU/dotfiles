#!/bin/bash
mkdir -p $HOME/.vim/bundle
git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
curl -s https://raw.githubusercontent.com/yangningBU/dotfiles/master/.vimrc > $HOME/.vimrc
vim +PluginInstall +qall
