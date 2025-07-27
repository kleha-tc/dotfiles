{ config, pkgs, ... }:
{
  home.username = "kleha";
  home.homeDirectory = "/home/kleha";
  home.stateVersion = "24.11";
  programs.home-manager.enable = true;

  imports = [
		./eww
		./code
    ./nvim
		./sway
		./emacs
		./river
		./wezterm
		./hyprland
		./git.nix
		./eza.nix
		./zsh
		./zsh/for_laptop.nix
		./kitty.nix
		./starship.nix
		./direnv.nix
		./matrix.nix
		./wofi.nix
    ./waybar.nix
    ./wlogout.nix
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

	home.packages = with pkgs; [
		gparted
		freecad
		element-call
		element-desktop
    cinny-desktop
		google-fonts
		keepassxc
		thunderbird
		nixd
		tinymist
		openscad
		bottles
		inkscape
		typst
		slack
		tree-sitter
		tree-sitter-grammars.tree-sitter-typst
    texliveMedium
		discord
		processing
		candy-icons
		pcmanfm
		epson-escpr
    elmPackages.elm-language-server
    typescript
    teams-for-linux
		brightnessctl
    kicad
		godot
		aircrack-ng
		vivaldi
		hypridle
	];
}
