{
  description = "";

  inputs = {
    nixpkgs = { url = "github:NixOS/nixpkgs/nixpkgs-unstable"; };
    flake-utils = { url = "github:numtide/flake-utils"; };
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        inherit (nixpkgs.lib) optional;
	pkgs = import nixpkgs { inherit system; };

	nodejs = pkgs.nodejs;
	yarn = pkgs.yarn;
      in
      {
        devShell = pkgs.mkShell {
	  buildInputs = [
	    nodejs
	    yarn
          ];
	};
      });
}
