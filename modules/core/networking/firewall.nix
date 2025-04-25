{ lib, ... }:

{
  firewall = {
    allowedUDPPortRanges = lib.optional lib.anyUserHasOption "elysium.services.kdeconnect.enable" {
      from = 1714;
      to = 1764;
    };
  };
}
