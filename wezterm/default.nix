{ pkgs, ...}:
{
	programs.wezterm = {
		enable = true;
	};
	home.file = {
		".wezterm.lua".source = ./wezterm.lua;
		"keybind.lua".source = ./keybind.lua;
		"ime.sh".source = ./ime.sh;
	};
	home.packages = with pkgs; [
		xclip
		libnotify
	];
}
