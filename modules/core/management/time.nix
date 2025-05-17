{
  config,
  lib,
  ...
}:

let
  cfg = config.elysium.management.time;
in
{
  options.elysium.management.time = {
    automatic-zone = lib.mkEnableOption "Automatic timezone" // {
      default = config.hostSpec.isDesktop;
    };
  };

  config = lib.mkMerge [
    { time.timeZone = lib.mkDefault "America/Chicago"; }
    { timesyncd.enable = true; }
    (lib.mkIf cfg.automatic-zone {
      # TODO: Find out why this doesnt work
      # elysium.management.geolocation.enable = lib.mkDefault true;

      services.automatic-timezoned.enable = true;
    })
  ];
}
