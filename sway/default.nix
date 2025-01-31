{ pkgs, ... } : 
{
	wayland.windowManager.sway = {
		enable = true;
		systemd = {
			enable = true;
		};
		wrapperFeatures.gtk = true;
		config = rec {
			modifier = "Mod4";
			terminal = "wezterm";
			menu = "wofi --show drun";
		};
	};
	home.packages = with pkgs; [
			wezterm
			wofi
			wlogout
			waybar
	];
}
