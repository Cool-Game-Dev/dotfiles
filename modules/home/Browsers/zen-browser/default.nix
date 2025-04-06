{ config, lib, pkgs, ... }:

let 
  cfg' = config.elysium.browsers;
  cfg = cfg'.browsers.zen;
in
{
  options.elysium.browsers.browsers.zen-browser.enable = lib.mkEnableOption "Zen Browser";


  config = lib.mkIf (cfg'.enable && cfg.enable) {
    home.packages = [ pkgs.zen-browser ];
  };
}