{ config, pkgs, ... }:

{
  home.username = "kleha";
  home.homeDirectory = "/home/kleha";
  home.stateVersion = "24.11";
  programs.home-manager.enable = true;

  programs = {
    git = {
      enable = true;
    };
  };
}
