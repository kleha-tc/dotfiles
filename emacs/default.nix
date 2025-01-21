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
			];
	};
	home.file = {
		".emacs.d/init.el".source = ./init.el;
		".emacs.d/org/init.org".source = ./org/init.org;
	};
}
