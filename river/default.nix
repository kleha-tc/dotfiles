{ pkgs, ... }:
{
  wayland.windowManager.river = {
    enable = true;
    settings = {
      map.normal = {
        # App Shortcuts
        "Super Return" = "spawn wezterm";
        "Super F" = "spawn firefox";
        "Super+Shift Q" = "spawn poweroff";
        "Super R" = "spawn 'wofi --show drun'";
        # Control
        "Super+Shift E" = "exit";
        "Super C" = "close";
        # Focus
        "Super J" = "focus-view next";
        "Super K" = "focus-view previous";
        # Layout Swap
        "Super+Shift J" = "swap next";
        "Super+Shift K" = "swap previous";
        # Zoom
        "Super+Shift Return" = "zoom";
        # Output
        "Super Period" = "focus-output next";
        "Super Comma" = "focus-output previous";
        "Super+Shift Period" = "send-to-output next";
        "Super+Shift Comma" = "send-to-output previous";
        # Resize
        "Super H" = "send-layout-cmd rivertile 'main-ratio -0.05'";
        "Super L" = "send-layout-cmd rivertile 'main-ratio +0.05'";
        "Super+Shift H" = "send-layout-cmd rivertile 'main-count +1'";
        "Super+Shift L" = "send-layout-cmd rivertile 'main-count -1'";
        # Floating Window
        "Super Space" = "toggle-float";
        "Super+Alt H" = "move left 100";
        "Super+Alt J" = "move down 100";
        "Super+Alt K" = "move up 100";
        "Super+Alt L" = "move right 100";
        "Super+Alt+Control H" = "snap left";
        "Super+Alt+Control J" = "snap down";
        "Super+Alt+Control K" = "snap up";
        "Super+Alt+Control L" = "snap right";
        "Super+Alt+Shift H" = "resize horizontal -100";
        "Super+Alt+Shift J" = "resize vertical 100";
        "Super+Alt+Shift K" = "resize vertical -100";
        "Super+Alt+Shift L" = "resize horizontal 100";
        # FullScreen
        "Super+Shift F" = "toggle-fullscreen";
        # Layout
        "Super Up" = "send-layout-cmd rivertile 'main-location top'";
        "Super Right" = "send-layout-cmd riviertile 'main-location right'";
        "Super Left" = "send-layout-cmd riviertile 'main-location left'";
        "Super Down" = "send-layout-cmd riviertile 'main-location down'";
      };
    };
		extraConfig = builtins.readFile ./init;
  };
	home.packages = with pkgs; [
			swaybg
			acpi
	];
}
