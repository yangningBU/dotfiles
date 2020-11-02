" * * * * * * * * * Begin vundle setup * * * * * * * * *
set nocompatible
filetype off

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'                  " Let Vundle manage Vundle, required
Plugin 'morhetz/gruvbox'                    " Gruvbox Color Theme Plugin (just another option)
Plugin 'tpope/vim-sensible.git'             " basic vimrc collection that most people like to use
Plugin 'tpope/vim-commentary'               " Adds new operator 'gc' for easy commenting in many languages
Plugin 'derekwyatt/vim-scala'               " Syntax highlighting for Scala
Plugin 'scrooloose/syntastic'               " Syntax checking for various languages (yay avoiding runtime errors)
Plugin 'maksimr/vim-jsbeautify'             " JS beautify (I don't know why I need both packages)
Plugin 'einars/js-beautify'
Plugin 'kien/ctrlp.vim'                     " Ctrl P for fast file searching from inside vim
Plugin 'rking/ag.vim'                       " Ag for fast grepping
Plugin 'tpope/vim-fugitive'                 " Fugitive is the amazing git plugin
Plugin 'tpope/vim-surround'                 " Surround makes quoting or bracketing text a lot easier
Plugin 'bronson/vim-visual-star-search'     " expand * search to work in visual mode too 
Plugin 'scrooloose/nerdtree'                " NERD tree for diretories
Plugin 'Lokaltog/vim-easymotion'            " Vimium-like movements with search (THIS IS BOMB)
Plugin 'bling/vim-airline'                  " Add powerline to show git branch

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" * * * * * * * * * End vundle setup * * * * * * * * *

" Standard Settings
set number                                  " Show line numbers
set cursorline                              " Highlight the current line
set paste                                   " Pasting should keep intended indentation
filetype on                                 " Autodetect filetype (to use with syntax highlighting)
syntax on                                   " Highlight that syntax so you know what's going on
set hlsearch                                " Highlight when you search for stuff - super helpful!
let g:netrw_dirhistmax = 0                  " Make it so .vim/.netrwhist file doesn't get written to

" Standardize the tab indent to 4 spaces instead
set expandtab
set shiftwidth=2
set tabstop=4
set smarttab

" set leader to be space
let mapleader = " "
nnoremap <leader>p :CtrlP<CR>

" Navigate between windows with space plus h,j,k,l
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" open NERD tree by on start up with a file
" autocmd vimenter * NERDTree
" Toggle open the Nerd Tree window with space+n
nnoremap <leader>n :NERDTreeToggle<CR>

" Reload vimrc with space+r
nnoremap <leader>r :source ~/.vimrc<CR>

" EasyMotion activate on leader f
nmap <leader>f <Plug>(easymotion-s)

" Fugitive shortcuts
nnoremap gs :Gstatus
nnoremap gd :Gdiff
nnoremap dg :diffget
nnoremap g3 :1,$+1diffget //3<CR>
nnoremap g2 :1,$+1diffget //2<CR>
nnoremap dp :diffput
nnoremap gr :Gread
nnoremap gw :Gwrite

" CTags
nnoremap <leader>t :CtrlPTag<cr>
nnoremap <leader>c :!ctags -R $(git rev-parse --show-toplevel) && echo "Done generating ctags"<CR>

set listchars=tab:▸\ ,trail:·,eol:¬,nbsp:_,extends:…
set list 

nnoremap <leader>m :!mvn test<CR>

" Gruvbox's italics go wonky outside of the GUI vim
if !has("gui_running")
  let g:gruvbox_italicize_comments=0
endif
set background=dark
colorscheme gruvbox

" use fancy for patched font
let g:Powerline_symbols = 'fancy'
set guifont=Monaco\ for\ Powerline

" compile and rebuild with maven just until the test phase
au BufNewFile,BufRead *.scala set makeprg=mvn\ clean\ test
nnoremap <Leader>m :wa <bar> :make<CR>

" prevent compile error file from showing up in current file, rather use the currently open tab for that file to show error
set switchbuf=useopen,usetab,newtab

" open marked files in ctrl-p in new tabs by default 
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

