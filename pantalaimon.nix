{ ... }:
{
	services.pantalaimon = {
		enable = true;
		settings = {
			local-matrix = {
				Homeserver = "https://matrix.org";
				ListenAddress = "127.0.0.1";
				ListenPort = 8009;
			};
		};
	};
}
