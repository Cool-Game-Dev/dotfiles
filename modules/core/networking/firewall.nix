{ lib, ... }:

{
  firewall = {
    allowedUDPPortRanges = lib.optional (lib.elysium.anyUserHasOption "elysium.programs.kdeconnect.enable") {
      from = 1714;
      to = 1764;
    };
  };
}
