{ ... }:
{
	networking.wireless.iwd = {
		enable = true;
		settings.Settings = {
			AutoConnect = true;
		};
	};
	hardware.bluetooth = {
		enable = true;
		powerOnBoot = true;
	};
	services.blueman.enable = true;
	networking.enableIPv6 = false;
}
