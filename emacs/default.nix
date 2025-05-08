{ config, pkgs, ...}:
{
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
      (treesit-grammars.with-grammars (
        p: with p; [
          tree-sitter-typst
        ]
      ))
		];
		extraConfig = builtins.readFile ./init.el;
	};
	home.file = {
		".emacs.d/org/init.org".source = ./org/init-for-nix.org;
	};
}
