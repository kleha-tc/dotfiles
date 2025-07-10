{ pkgs, ...}:
{
	home.packages = with pkgs; [
		pantalaimon
		element-desktop
		element-call
		fluffychat
	];
	xdg.configFile."pantalaimon/pantalaimon.conf".source = pkgs.writeText "pantalaimon.conf" ''
		[matrix-org]
		Homeserver = https://matrix.org
		ListenAddress = localhost
		ListenPort = 8009
	'';
}
