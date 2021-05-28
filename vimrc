set nocompatible
filetype off
syntax on


set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'dylanaraps/wal.vim'
Plugin 'tpope/vim-eunuch'
Plugin 'davidhalter/jedi-vim'
Plugin 'preservim/nerdtree'

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
autocmd FileType python setlocal completeopt-=preview
map <C-n> :NERDTreeToggle<CR>
