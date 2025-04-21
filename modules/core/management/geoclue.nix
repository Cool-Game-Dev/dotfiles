{ config, lib, hostSpec, ... }:

let 
  cfg = config.elysium.management.geolocation;
in
{
  options.elysium.geolocation.enable = lib.mkEnableOption "Geolocation" // {
    default = !hostSpec.isServer;
  };

  config = {
    services.geoclue2.enable = cfg.enable;
  };
}