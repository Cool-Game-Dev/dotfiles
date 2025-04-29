{ config, pkgs, ... }:

{
  systemd.services."NetworkManager-wait-online".enable = false;
  
  boot = {
    binfmt.emulatedSystems = [ "aarch64-linux" ];
    kernelPackages = pkgs.linuxPackages_zen;
    initrd.systemd.enable = true;

    loader = {

      efi.canTouchEfiVariables = true;

      grub = {
        enable = true;
        efiSupport = true;
        devices = [ "nodev" ];
      };
    };
  };
}
