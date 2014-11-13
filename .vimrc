" * * * * * * * * * Begin vundle setup * * * * * * * * *

set nocompatible
filetype off

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

" Solarized Color Theme Plugin
Plugin 'altercation/vim-colors-solarized'

" Gruvbox Color Theme Plugin (just another option)
Plugin 'morhetz/gruvbox'

" The Sensible plugin is a basic vimrc collection that most people like to use
" and saves us from having to do it manually
Plugin 'tpope/vim-sensible.git'

" Adds new operator 'gc' for easy commenting in many languages
Plugin 'tpope/vim-commentary'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" * * * * * * * * * End vundle setup * * * * * * * * *
set nu
filetype plugin indent on
syntax on
" Gruvbox's italics go wonky outside of the GUI vim
if !has("gui_running")
	let g:gruvbox_italicize_comments=0
endif
" let g:solarized_termcolors=256
set background=dark
colorscheme gruvbox
" colorscheme solarized

" Highlight the current line
set cursorline

" Remap color to semicolon and vis-versa
nnoremap : ;
nnoremap ; :
vnoremap ; :
vnoremap : ;

set hlsearch
set mouse:a

" Text tab indent etc.
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab
