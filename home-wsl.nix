{ pkgs, ...}:
{
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
		home.packages = with pkgs; [
			github-cli
		];
  };
}
