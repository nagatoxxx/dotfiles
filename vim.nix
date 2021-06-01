{ pkgs, ... }:
{
  programs.vim.defaultEditor = true;

  environment.systemPackages = with pkgs; [
    ((vim_configurable.override { python = python3; }).customize {
      name = "vim";
      vimrcConfig.packages.myplugins = with pkgs.vimPlugins; {
        start = [ vim-nix ]; # load plugins on startup
      };
      vimrcConfig.customRC = ''
        set nocompatible
        syntax on
        filetype plugin on
        filetype plugin indent on
        set noswapfile
        set smarttab
        set tabstop=8
        let python_highlight_all = 1
        set nu
        set hidden
        set colorscheme wal
        autocmd FileType python setlocal completeopt-=preview
        map <C-n> :NERDTreeToggle<CR>
        let g:airline_powerline_fonts = 1
        set backspace=indent,start,eol
      '';
      vimrcConfig.plug.plugins = with pkgs.vimPlugins; [ wal-vim vim-eunuch jedi-vim nerdtree ];
    })
  ];
}

