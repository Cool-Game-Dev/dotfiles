{
  config,
  lib,
  hostSpec,
  ...
}:

let
  cfg = config.elysium.services.clamav;
in
{
  options.elysium.services.clamav = {
    enable = lib.mkEnableOption "ClamAV" // {
      default = hostSpec.isDesktop;
    };
    daemon.enable = lib.mkEnableOption "ClamAV daemon" // {
      default = hostSpec.isDesktop;
    };

    scanner.enable = lib.mkEnableOption "ClamAV scanner" // {
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    services.clamav = {
      daemon.enable = cfg.daemon.enable;
      scanner.enable = cfg.scanner.enable;
    };
  };
}
