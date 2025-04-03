{ config, lib, pkgs, ... }:

let 
  cfg' = config.elysium.browsers;
  cfg = cfg'.zen;
in
{
  options.dotfyls.browsers.browsers.zen-browser.enable = lib.mkEnableOption "Zen Browser";


  config = lib.mkIf (cfg'.enable && cfg.enable) {
    home.packages = [ pkgs.zen-browser ];
  };
}