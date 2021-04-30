  1 set nocompatible
  2 filetype off
  3 syntax on
  4
  5
  6 set rtp+=~/.vim/bundle/Vundle.vim
  7 call vundle#begin()
  8
  9 Plugin 'gmarik/Vundle.vim'
 10 Plugin 'bling/vim-airline'
 11 Plugin 'dylanaraps/wal.vim'
 12 Plugin 'tpope/vim-eunuch'
 13
 14 call vundle#end()
 15 filetype on
 16 filetype plugin on
 17 filetype plugin indent on
 18
 19
 20 set noswapfile
 21 set smarttab
 22 set tabstop=8
 23 let python_highlight_all = 1
 24
 25
 26 set nu
 27 set hidden
 28
 29 colorscheme wal
