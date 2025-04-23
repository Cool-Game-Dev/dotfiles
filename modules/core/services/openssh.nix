{ config, lib, ... }:

let 
  cfg = config.elysium.services.openssh;
in 
{
  options.elysium.services.openssh.enable = lib.mkEnableOption "OpenSSH" // {
    default = true;
  };

  config = lib.mkIf cfg.enable {
    services.openssh.enable = true;
  };
}