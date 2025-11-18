{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      catppuccin.catppuccin-vsc
      catppuccin.catppuccin-vsc-icons
      haskell.haskell
      ziglang.vscode-zig
      rust-lang.rust-analyzer
      mechatroner.rainbow-csv
      jnoortheen.nix-ide
      myriad-dreamin.tinymist
      tomoki1207.pdf
    ];
  };
  xdg.configFile = {
    "Code/User/settings.json".source = ./settings.json;
  };
}
