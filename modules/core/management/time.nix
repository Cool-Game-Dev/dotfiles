{ config, lib, hostSpec, ... }:

let
  cfg = config.elysium.management.time;
in
{
  options.elysium.management.time = {
    automatic-zone = lib.mkEnableOption "Automatic timezone" // {
      default = hostSpec.isDesktop;
    };
  };

  config = lib.mkMerge [
    { time.timeZone = lib.mkDefault "America/Chicago"; }
    { timesyncd.enable = true;}
    (lib.mkIf cfg.automatic-zone {
      elysium.management.geolocation.enable = lib.mkDefault true;

      services.automatic-timezoned.enable = true;
    })
  ];
}