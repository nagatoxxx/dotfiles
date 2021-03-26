set nocompatible              
filetype off                

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'dylanaraps/wal.vim'
Plugin 'tpope/vim-eunuch'

call vundle#end()
filetype on
filetype plugin on
filetype plugin indent on


set noswapfile
set smarttab
set tabstop=8
let python_highlight_all = 1


set nu
set hidden

colorscheme wal
