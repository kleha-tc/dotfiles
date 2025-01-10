{ config, pkgs, ...}:
{
	programs.emacs = {
		enable = true;
		package = pkgs.emacs-nox;
		extraPackages = epkgs: with epkgs; [
			catppuccin-theme
			ddskk
			];
	};
	home.file = {
		".emacs.d/init.el".source = ./init.el;
	};
}
