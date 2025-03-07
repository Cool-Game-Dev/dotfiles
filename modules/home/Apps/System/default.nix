{ config, pkgs, ... }:

{
  imports = [ ./blueman.nix ./dolphin.nix ./kitty.nix ./protonvpn.nix ];
}
