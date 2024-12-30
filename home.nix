{ config, pkgs, ... }:
{
  home.username = "kleha";
  home.homeDirectory = "/home/kleha";
  home.stateVersion = "24.11";
  programs.home-manager.enable = true;

  imports = [
    ./nvim
		./code
    ./kitty.nix
		./sway
  ];
  programs = {
    git = {
      enable = true;
      userName = "haru-0205";
      userEmail = "rm23081b@st.omu.ac.jp";
      extraConfig = {
        init = {
          defaultBranch = "main";
	      };
      };
    };
    gh = {
      enable = true;
    };
    eza = {
      enable = true;
      icons = "auto";
      colors = "auto";
      git = true;
    };
    zsh = {
      enable = true;
      shellAliases = {
        ls = "eza --git --icons=auto";
        ll = "eza -l --git --icons=auto";
        la = "eza -a --git --icons=auto";
        lla = "eza -la --git --icons=auto";
        lt = "eza --tree --git --icons=auto";
      };
    };
  };
}

