{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
		nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ nixpkgs, home-manager, nixos-wsl, ... }: {
    nixosConfigurations = {
      kleha-nix = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
					nixos-wsl.nixosModules.default {
						# Enable NixOS-WSL Module
						wsl.enable = true;
						wsl.defaultUser = "kleha";
					}
					./configuration.nix
					home-manager.nixosModules.home-manager
					{
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;
						home-manager.users.kleha = import ./home.nix;
						home-manager.backupFileExtension = "bkup";
					}
        ];
      };
    };
  };
}
