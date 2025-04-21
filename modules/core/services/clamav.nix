{ config, lib, hostSpec, ... }:

let 
  cfg = config.elysium.clamav;
in
{
  options.elysium.clamav = { 
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