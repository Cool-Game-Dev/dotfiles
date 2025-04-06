{ config, lib, ... }:

let
  cfg = config.elysium.boot.loader;
in
{
  options.elysium.boot.loader.grub = {
    enable = lib.mkEnableOption "Grub bootloader" // {
      default = true;
    };
  };

  boot.loader = {
    grub = lib.mkIf cfg.grub.enable {
      enable = true;
      efiSupport = true;
      devices = [ "nodev" ];
    };
  };
}