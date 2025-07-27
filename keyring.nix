{ pkgs, ... }:
{
	security.polkit.enable = true;
	security.pam.services.kleha.kwallet = {
		enable = true;
		package = pkgs.kdePackages.kwallet-pam;
	};
}
