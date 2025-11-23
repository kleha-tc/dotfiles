{ pkgs, ... }:
{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs;
    extraPackages =
      epkgs: with epkgs; [
        catppuccin-theme
        neotree
        ddskk
        init-loader
        ob-rust
        org-nix-shell
        magit
        company
        web-mode
        ivy
        swiper
        counsel
        rust-mode
        nix-mode
        python-mode
        typst-ts-mode
        elm-mode
        direnv
        vue-mode
        yuck-mode
        copilot
        copilot-chat
        lsp-mode
        lsp-ui
        lsp-ivy
        flycheck
        yasnippet
        which-key
        powerline
        (treesit-grammars.with-grammars (
          p: with p; [
            tree-sitter-typst
            tree-sitter-html
          ]
        ))
      ];
    overrides = self: super: {
      direnv = self.melpaPackages.direnv;
    };
    extraConfig = builtins.readFile ./init.el;
  };
  home.file = {
    ".emacs.d/conf".source = ./conf;
  };
}
