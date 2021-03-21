pkgs:
with pkgs; let
  ancient-colors-vim = import ./ancient-colors-vim.nix pkgs;
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
