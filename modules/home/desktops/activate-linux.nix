{ config, lib, pkgs, ... }:

let 
  cfg' = config.elysium.desktops;
  cfg = cfg'.activate-linux;
in
{
  options.elysium.desktops.activate-linux.enable = lib.mkEnableOption "Activate Linux Watermark";

  config = lib.mkIf (cfg'.enable && cfg.enable) {
    home.packages = [ pkgs.activate-linux ];
  }
}