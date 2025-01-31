{ pkgs, ... }:
{
	programs.kitty.enable = true;
	wayland.windowManager.hyprland = {
		enable = true;
		systemd = {
			enable = true;
		};
	};
}
