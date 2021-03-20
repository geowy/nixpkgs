pkgs: with pkgs;
let
  ancient-colors-vim = vimUtils.buildVimPluginFrom2Nix {
    name = "ancient-colors-vim";

    src = fetchFromGitHub {
      owner = "saalaa";
      repo = "ancient-colors.vim";
      rev = "67b031f7daf4aa42cb602ba335df4bdea2627da5";
      sha256 = "1mckajzp9y21hx3yvmdq020q2c2drwkmk30xa35kpgva8jzxa7l9";
    };
  };
in
  neovim.override {
    configure = {
      packages.myVimPackage = with vimPlugins; {
        start = [
          ack-vim
          ancient-colors-vim
          bclose-vim
          fzf-vim
          matchit-zip
          ranger-vim
          syntastic
          vim-better-whitespace
          vim-fugitive
          vim-go
          vim-polyglot
          vim-signature
          vim-signify
          vim-terraform
        ];
      };

      customRC = ''
        " important
        set nocompatible
        set t_Co=256
        filetype plugin indent on
        let mapleader = ","

        " plugin config
        let g:Lf_StlSeparator = { 'left': '\', 'right': '\' }
        let g:ackprg = 'ag --vimgrep'
        let g:syntastic_always_populate_loc_list = 1
        let g:syntastic_auto_loc_list = 1
        let g:syntastic_check_on_wq = 0
        let g:syntastic_javascript_checkers = ['eslint']
        let g:terraform_align=1
        let g:terraform_fmt_on_save=1

        map <Leader>g :GFiles<CR>

        " windows
        set splitbelow
        set splitright

        " displaying text
        set nowrap
        set number

        " moving around, searching and patterns
        set path+=**
        set incsearch
        set ignorecase
        set smartcase
        nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':'\'<CR><CR><C-L>

        " syntax, hightlighting and spelling
        set background=light
        colorscheme ancient
        set hlsearch
        syntax on

        " using the mouse
        set mouse=a
        set mousefocus

        " messages and info
        set showcmd
        set ruler
        set confirm

        " selecting text
        set clipboard=unnamed,unnamedplus

        " editing text
        map Y y$
        set backspace=indent,eol,start

        " tabs and indenting
        set tabstop=8
        set shiftwidth=2
        set smarttab
        set softtabstop=2
        set expandtab
        set autoindent
        set smartindent

        " reading and writing files
        set autoread

        " the swap file
        set directory-=.

        " command line editing
        set history=1000
        set wildignorecase
        set wildmenu

        " multi-byte characters
        set encoding=utf-8

        " scripts
        noremap <leader>r :w<return>:!./%<return>
      '';
    };
  }
