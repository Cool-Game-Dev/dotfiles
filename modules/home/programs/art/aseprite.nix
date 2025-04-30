{ config, pkgs, ... }:

let
  cfg = config.elysium.programs.art.aseprite;
in
{
  options.elysium.programs.art.aseprite.enable = lib.mkEnableOption
  home.packages = [ pkgs.aseprite ];
}
