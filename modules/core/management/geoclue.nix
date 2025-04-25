{
  config,
  lib,
  hostSpec,
  ...
}:

let
  cfg = config.elysium.management.geolocation;
in
{
  options.elysium.geolocation.enable = lib.mkEnableOption "Geolocation" // {
    default = !hostSpec.isServer;
  };

  config = lib.mkIf cfg.enable {
    services.geoclue2.enable = cfg.enable;
    location.provider = "geoclue2";
  };
}
