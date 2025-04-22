{ config, lib, hostSpec, ... }:

let 
  cfg = config.elysium.services.printing;
in
{
  options.elysium.services.printing.enable = lib.mkEnableOption "CUPS printing" // {
    default = hostSpec.isDesktop;
  };

  cfg = lib.mkIf cfg.enable {
    services.printing.enable = true;
  };
}