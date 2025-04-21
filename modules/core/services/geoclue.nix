{ config, lib, hostSpec, ... }:

let 
  cfg = config.elysium.geoclue;
in
{
  options.elysium.geoclue.enable = lib.mkEnableOption "Geoclue" // {
    default = !hostSpec.isServer;
  };

  config = {
    services.geoclue2.enable = cfg.enable;
  };
}