{ config, ... }:

{
  networking = {
    hostName = config.hostSpec.hostName;

    networkmanager = {
      enable = config.hostSpec.networkmanager.enable;
      wifi.scanRandMacAddress = config.hostSpec.networkmanager.scanRandMacAddress;
    };

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
