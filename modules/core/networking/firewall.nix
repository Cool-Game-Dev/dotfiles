{ lib, ... }:

{
  firewall = {
    allowedUDPPortRanges = lib.optional lib.anyUserHasOption "elysium.programs.kdeconnect.enable" {
      from = 1714;
      to = 1764;
    };
  };
}
