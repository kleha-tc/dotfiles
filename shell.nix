{ pkgs, ... }:
{
	programs.zsh.enable = true;
	users.defaultUserShell = pkgs.zsh;
	programs.nix-ld.enable = true;
}
