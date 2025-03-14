{ config, pkgs, ... }:

{
  home.packages = [ pkgs.swaynotificationcenter ];

  services.swaync = {
    style = ./style.css;
  };
}
