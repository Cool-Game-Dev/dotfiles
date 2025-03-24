{ config, systemSettings, ... }:

{
  networking = {
    networkmanager = {
      enable = true;
      wifi.scanRandMacAddress = false;
    };
    hostName = systemSettings.hostName;

    firewall = {
      allowedUDPPortRanges = [
        { # KDE Connect
          from = 1714;
          to = 1764;
        } 
      ];
    };
  };
}
