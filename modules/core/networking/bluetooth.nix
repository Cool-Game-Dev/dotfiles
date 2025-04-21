{ config, lib, hostSpec, ... }:

let
  cfg = config.elysium.networking.bluetooth;
in {
  options.elysium.networking.bluetooth.enable = lib.mkEnableOption "Bluetooth" // {
    default = hostSpec.isDesktop;
  };

  config = {
    hardware.bluetooth.enable = cfg.enable;
  };
}
