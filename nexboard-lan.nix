{ ... }:
{
  networking.interfaces.enp0s20f0u2 = {
    ipv4.addresses = [
      {
        address = "192.168.10.20";
        prefixLength = 24;
      }
    ];
    useDHCP = true;
  };
}
