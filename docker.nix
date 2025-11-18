{ config, pkgs, ... }:
{
  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };
  virtualisation.libvirtd.enable = true;

  boot.extraModprobeConfig = ''
    		options kvm_intel nested=1
    		options kvm_intel emulated_invaild_guest_state=0
    		options kvm ignore_msrs=1
    	'';
}
