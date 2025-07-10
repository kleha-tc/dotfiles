{ pkgs, ...}:
{
  wayland.windowManager.river = {
    enable =true;
		extraConfig = builtins.readFile ./init;
  };
}
