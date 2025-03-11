{ config, pkgs, ... }:
{
  home.username = "kleha";
  home.homeDirectory = "/home/kleha";
  home.stateVersion = "24.11";
  programs.home-manager.enable = true;

  imports = [
		./nvim
		./code
		./emacs
		./git.nix
		./eza.nix
		./zsh.nix
		./starship.nix
  ];
  programs = {
    gh = {
      enable = true;
    };
  };
	home.file = {
		"skk/SKK-JISYO.L".source = ./skk/SKK-JISYO.L;
		"skk/SKK-JISYO.jinmei".source = ./skk/SKK-JISYO.jinmei;
		"skk/SKK-JISYO.station".source = ./skk/SKK-JISYO.station;
	};
}

