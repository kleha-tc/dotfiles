{ pkgs, ... }:
{
  imports = [
    ./emacs
    ./git.nix
    ./direnv.nix
    ./starship.nix
    ./wezterm
    ./nushell
  ];
  home.packages = with pkgs; [
    github-cli
    nixd
    tinymist
    typst
    raycast
  ];
  home.stateVersion = "23.11";
}
