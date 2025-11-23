{ pkgs, ... }:
{
  programs.eww = {
    enable = true;
  };
	xdg.configFile = {
		"eww/eww.yuck".source = ./eww.yuck;
		"eww/eww.scss".source = ./eww.scss;
		"eww/modules".source = ./modules;
	};
  home.packages = with pkgs; [
    python3
    acpi
  ];
}
