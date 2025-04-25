{ config, lib, ... }:

let
  cfg = config.elysium.networking.networkmanager;
in
{
  options.elysium.networking.networkmanager = {
    enable = lib.mkEnableOption "NetworkManager" // {
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    networking.networkmanager = {
      enable = true;
    };
  };
}
