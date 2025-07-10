{ config, pkgs, ... }:
{
	i18n.inputMethod = {
		enable = true;
		type = "fcitx5";
		fcitx5.addons = with pkgs; [ fcitx5-skk fcitx5-gtk fcitx5-skk-qt ];
    fcitx5.waylandFrontend = true;
	};
}
