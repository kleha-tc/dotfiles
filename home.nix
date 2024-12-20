{ config, pkgs, ... }:

{
  home.username = "kleha";
  home.homeDirectory = "/home/kleha";
  home.stateVersion = "24.11";
  programs.home-manager.enable = true;

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
    vscode = {
      enable = true;
      extensions = with pkgs.vscode-extensions; [
        catppuccin.catppuccin-vsc
        catppuccin.catppuccin-vsc-icons
        haskell.haskell
        ziglang.vscode-zig
        rust-lang.rust-analyzer
        mechatroner.rainbow-csv
        jnoortheen.nix-ide
      ];
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
    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      withNodeJs = true;
			plugins = with pkgs.vimPlugins; [
			  nvim-treesitter
				nvim-treesitter-parsers.lua
				nvim-treesitter-parsers.nix
			];
      extraLuaConfig = ''
        vim.opt.runtimepath:prepend("${./nvim}")
        require("001_main")
      '';
    };
  };
  xdg.configFile = {
    "Code/User/settings.json".source = ./code/settings.json;
  };
}
