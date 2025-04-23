{ config, lib, hostSpec, ... }:

let 
  logindHandlerType = lib.types.enum [
    "ignore"
    "poweroff"
    "reboot"
    "sleep"
    "lock"
  ];

  cfg = config.elysium.services.logind;
in
{
  options.elysium.services.logind = {
    enable = lib.mkEnableOption "logind" // {
      default = hostSpec.isDesktop;
    };

    lidSwitch = lib.mkOption {
      default = "lock";
      type = logindHandlerType;
    };
  };

  config = lib.mkIf cfg.enable {
    services.logind ={
      enable = true;
      lidSwitch = cfg.lidSwitch;
    };
  };
}