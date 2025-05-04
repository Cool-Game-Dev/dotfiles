{ config, pkgs, ... }:

let
  cfg' = config.elysium.programs.internet;
  
in
{
  home.packages = [ pkgs.freetube ];
}
