{ config, lib,... }:

{
  networking = {
    hostName = config.hostSpec.hostName;

    networkmanager = {
      enable = config.hostSpec.networkmanager.enable;
      wifi.scanRandMacAddress = config.hostSpec.networkmanager.scanRandMacAddress;
    };

    firewall = {
      allowedUDPPortRanges = 
        lib.optional lib.anyUserHasOption "elysium.services.kdeconnect.enable" { 
          from = 1714;
          to = 1764;
      };
    };
  };
}
