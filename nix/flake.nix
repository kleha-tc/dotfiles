{
  description = "";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    waveforms.url = "github:liff/waveforms-flake";
  };

  outputs = {self, flake-utils, nix-vscode-extensions, nixpkgs, waveforms}: {
    nixosConfigurations = {
      myNixOS = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
	modules = [
	  ./configuration.nix
	  waveforms.nixosModule
	  ({users.users.haru.extraGroups = ["plugde"]; })
	];
      };
    };
  };
}
