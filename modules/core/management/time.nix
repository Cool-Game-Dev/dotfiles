{ config, lib, hostSpec, ... }:

let
  cfg = config.elysium.management.time;
in
{
  options.elysium.management.time.automatic-zone = lib.mkEnableOption "automatic timezone" // {
    default = hostSpec.isDesktop;
  };

  config = lib.mkMerge [
    { time.timeZone = lib.mkDefault "America/Chicago"; }

    (lib.mkIf cfg.automatic-zone {
      elysium.management.geolocation.enable = lib.mkDefault true;

      services.automatic-timezoned.enable = true;
    })
  ];
}