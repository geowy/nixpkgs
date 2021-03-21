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

      customRC = builtins.readFile ./init.vim;
    };
  }
