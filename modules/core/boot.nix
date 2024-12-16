{ config, pkgs, ... }: 

{
  boot = {
  
    kernelPackages = pkgs.linuxPackages_zen;
    initrd.systemd.enable = true;
    resumeDevice = "/var/swapfile";
    
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
