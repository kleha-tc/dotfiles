{
  pkgs,
  lib,
  inputs,
  ...
}:
{
  nixpkgs.hostPlatform = "aarch64-darwin";
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = 7;
  users.users.kleha = {
    name = "kleha";
    home = "/Users/kleha";
  };
  programs.nix-index.enable = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  environment.systemPackages = with pkgs; [
    hackgen-nf-font
  ];
}
