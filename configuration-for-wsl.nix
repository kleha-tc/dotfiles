# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ config, lib, pkgs, ... }:

let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in
{
  nixpkgs.config.allowUnfree = true;

  imports = [
    <nixos-wsl/modules>
    (import "${home-manager}/nixos")
    ./direnv.nix
    ./shell.nix
  ];

  wsl.enable = true;
  wsl.defaultUser = "kleha";
  nix.settings.experimental-features = ["nix-command" "flakes"];

  home-manager.users.kleha = {
  	imports = [
		./nvim
		./emacs
		./git.nix
		./eza.nix
		./zsh/for_wsl.nix
		./direnv.nix
		./starship.nix
	];
	home.stateVersion = "23.11";
  };
  

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
