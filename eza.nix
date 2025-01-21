{ pkgs, ...}:
{
	programs.eza = {
		enable = true;
		icons = "auto";
		colors = "auto";
		git = true;
	};
}
