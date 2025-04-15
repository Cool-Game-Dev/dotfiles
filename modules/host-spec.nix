{ config, lib, ... }:

{
  options.hostSpec = {
    username = lib.mkOption {
      type = lib.types.str;
      description = "The username of the host admin";
      default = "Coolio";
    };

    hostName = lib.mkOption {
      type = lib.types.str;
      description = "The hostname of the host";
    };

    networking = {
      networkmanager = {
        enable = lib.mkEnableOption "NetworkManager" // {
          default = true;
        };

        scanRandMacAddress = lib.mkEnableOption "NetworkManager" // {
          default = true;
        };
      };
    };

    hardware = {
      bluetooth.enable = lib.mkEnableOption "Bluetooth" // {
        default = !config.hostSpec.isServer;
      };
    };

    isServer = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
}
