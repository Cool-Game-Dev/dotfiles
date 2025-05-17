{ config, lib, ... }:

let
  cfg = config.elysium.boot;
in
{
  imports = lib.elysium.scanPaths ./.;
  options.elysium.boot.pauseForInternet =
    lib.mkEnableOption "Pause the boot process to wait for Internet to connet."
    // {
      default = config.hostSpec.isServer;
    };

  config = {
    boot.initrd.systemd.enable = true;

    systemd.services."NetworkManager-wait-online".enable = cfg.enable;
  };
}
