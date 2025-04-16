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
		];
		extraConfig = builtins.readFile ./init.el;
	};
	home.file = {

		".emacs.d/org/init.org".source = ./org/init-for-nix.org;
	};
}
