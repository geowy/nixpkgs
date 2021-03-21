{
  packageOverrides = pkgs: rec {
    neovim = (import ./neovim.nix pkgs);

    all = with pkgs; buildEnv {
      name = "all";
      paths = [
        # cloud
        aws-vault
        awscli
        terraform

        # file mgmt
        ranger
        tree

        # git
        gh
        git
        tig

        # langs
        deno
        go
        pgcli
        postgresql
        ruby

        # misc
        direnv
        fswatch
        fzf
        htop
        pstree

        # text
        neovim
        silver-searcher
        universal-ctags

        # web
        httpie
        jq
      ];
    };
  };
}
