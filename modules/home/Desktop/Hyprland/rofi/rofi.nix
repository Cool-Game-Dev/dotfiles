{ config, pkgs, ... }:

{
  home.packages = [ pkgs.rofi-wayland ];
}
