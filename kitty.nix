{ pkgs, ... }:
{
	programs.kitty = {
		enable = true;
		shellIntegration.enableZshIntegration = true;
		themeFile = "Catppuccin-Frappe";
	};
}
