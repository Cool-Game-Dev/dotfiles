{ config, pkgs, ... }:

{
  imports = [
    ./aseprite.nix
    ./inkscape.nix
  ];
}
