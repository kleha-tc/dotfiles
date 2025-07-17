{...}:
{
  programs.zsh.shellAliases = {
    rebuild = "sudo nixos-rebuild switch --flake .#nixos-wsl";
  };
}
