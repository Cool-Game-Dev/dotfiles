{ config, pkgs, ... }: 

{
  boot = {
  
    kernelPackages = pkgs.linuxPackages_zen;
    kernelParams = [ "resume_offset=7979008" ];
    initrd.systemd.enable = true;
    resumeDevice = "/dev/mapper/cryptroot";
    
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
