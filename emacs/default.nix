{ config, pkgs, ...}:
{
	programs.emacs = {
	enable = true;
		package = pkgs.emacs-nox;
		extraPackages = epkgs: with epkgs; [
			catppuccin-theme
			neotree
			ddskk
			init-loader
			ob-rust
			org-nix-shell
		];
		extraConfig = builtins.readFile ./init.el;
	};
	home.file = {
		".emacs.d/org/init.org".source = ./org/init.org;
	};
}
