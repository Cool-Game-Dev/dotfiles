{ config, lib, hostSpec, ... }:

let 
  cfg = config.elysium.services.clamav;
in
{
  options.elysium.services.clamav = { 
    daemon = lib.mkEnableOption "ClamAV daemon" // {
      default = hostSpec.isDesktop;
    };

    scanner = lib.mkEnableOption "ClamAV scanner" // {
      default = true;
    };
  };

  config = {
    services.clamav = {
      daemon.enable = cfg.daemon.enable;
      scanner.enable = cfg.scanner.enable;
    };
  };
}