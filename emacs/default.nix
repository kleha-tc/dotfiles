{ config, pkgs, ...}:
{
	nixpkgs.config.allowUnfree = true;
	programs.emacs = {
	enable = true;
		package = pkgs.emacs;
		extraPackages = epkgs: with epkgs; [
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
			rust-mode
			nix-mode
      python-mode
      typst-ts-mode
      elm-mode
      direnv
      vue-mode
      ement
			yuck-mode
      copilot
      copilot-chat
      (treesit-grammars.with-grammars (
        p: with p; [
          tree-sitter-typst
          tree-sitter-html
        ]
      ))
		];
    overrides = self: super: {
      direnv =  self.melpaPackages.direnv;
    };
		extraConfig = builtins.readFile ./init.el;
	};
	home.file = {
		".emacs.d/org/init.org".source = ./org/init-for-nix.org;
  };
}

