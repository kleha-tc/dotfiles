{ config, pkgs, ...}:
{
	programs.emacs = {
	enable = true;
		package = pkgs.emacs-nox;
		extraPackages = epkgs: with epkgs; [
			catppuccin-theme
			dracula-theme
			solarized-theme
			neotree
			ddskk
			init-loader
			ob-rust
			org-nix-shell
			magit
			lsp-mode
			lsp-ui
			company
			web-mode
			ivy
			rust-mode
			nix-mode
		];
		extraConfig = builtins.readFile ./init.el;
	};
	home.file = {
		".emacs.d/org/init.org".source = ./org/init-for-nix.org;
	};
}
