{ config, lib, pkgs, ... }:

let 
  cfg' = config.elysium.browsers;
  cfg = cfg'.firefox;
in
{
  options.dotfyls.browsers.browsers.firefox.enable = lib.mkEnableOption "Firefox";


  config = lib.mkIf (cfg'.enable && cfg.enable) {
    programs.firefox.enable = true;
  };
}