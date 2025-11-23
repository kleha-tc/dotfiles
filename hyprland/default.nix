{ pkgs, ... }:
{
	programs.kitty.enable = true;
	wayland.windowManager.hyprland = {
		enable = true;
		systemd = {
			enable = true;
		};
    settings = {
      "$mod" = "SUPER";
			"$term" = "wezterm";
			"$filemgr" = "pcmanfm";
			"$menu" = "wofi --show drun";
      bind = [
        "$mod, F, exec, firefox"
				"$mod, C, killactive"
				"$mod, E, exec, $filemgr"
				"$mod, V, toggleFloating"
				"$mod, R, exec, $menu"
        "$mod, return, exec, $term"
        "$mod, Q, exec, wlogout"
				# Workspaces
				"$mod, 1, workspace, 1"
				"$mod, 2, workspace, 2"
				"$mod, 3, workspace, 3"
				"$mod, 4, workspace, 4"
				"$mod, 5, workspace, 5"
				"$mod, 6, workspace, 6"
				"$mod, 7, workspace, 7"
				"$mod, 8, workspace, 8"
				"$mod, 9, workspace, 9"
				"$mod, 0, workspace, 10"
				"$mod SHIFT, 1, movetoworkspace, 1"  
				"$mod SHIFT, 2, movetoworkspace, 2"  
				"$mod SHIFT, 3, movetoworkspace, 3"  
				"$mod SHIFT, 4, movetoworkspace, 4"  
				"$mod SHIFT, 5, movetoworkspace, 5"  
				"$mod SHIFT, 6, movetoworkspace, 6"  
				"$mod SHIFT, 7, movetoworkspace, 7"  
				"$mod SHIFT, 8, movetoworkspace, 8"  
				"$mod SHIFT, 9, movetoworkspace, 9"  
				"$mod SHIFT, 0, movetoworkspace, 10"  
				# Window
				"$mod, left, movefocus, l"
				"$mod, right, movefocus, r"
				"$mod, up, movefocus, u"
				"$mod, down, movefocus, d"
				"$mod, L, movefocus, l"
				"$mod, H, movefocus, r"
				"$mod, K, movefocus, u"
				"$mod, J, movefocus, d"
				# scratchpad
				"$mod, S, togglespecialworkspace, magic1"
				"$mod SHIFT, S, movetoworkspace, special:magic1"
				"$mod ALT, S, togglespecialworkspace, magic2"
				"$mod ALT SHIFT, S, movetoworkspace, special:magic2"
      ];
			monitor = [
				", preferred, auto, 1"
			];
			bindel = [
				",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
				",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
				",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
				",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
				",XF86MonBrightnessUp, exec, brightnessctl set 5%+"
				",XF86MonBrightnessDown, exec, brightnessctl set 5%-"
			];
			bindm = [
				"$mod, mouse:272, movewindow"
				"$mod, mouse:273, resizewindow"
			];
      exec-once = [
				"fcitx5 -dr"
				"eww open hyprpanel"
				"hypridle"
    ];
    };
	};
}
