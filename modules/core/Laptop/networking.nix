{ config, systemSettings, ... }:

{
  networking = {
    networkmanager = {
      enable = true;
      wifi.scanRandMacAddress = false;
    };
    hostName = systemSettings.hostName;

  };
}
