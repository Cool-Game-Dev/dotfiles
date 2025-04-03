{ config, lib, pkgs, ... }:

let 
  cfg'' = config.elysium.desktops;
  cfg' = cfg''.desktops.hyprland;
  cfg = cfg'.hyprlock;
in
{
  options.elysium.desktops.hyprland.hyprpicker.enable = lib.mkEnableOption "Hyprpicker" // {
    default = cfg'.enable;
  };

  config = lib.mkIf (cfg''.enable && cfg'.enable && cfg.enable) {
    home.packages = [ pkgs.hyprpicker ];
  };
}
