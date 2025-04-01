{ config, lib, pkgs, ... }:

let 
  cfg' = config.elysium.desktops.hyprland;
  cfg = cfg'.hyprpicker;
in
{
  options.elysium.desktops.hyprland.hyprpicker.enable = lib.mkEnableOption "Hyprpicker" // {
    default = cfg'.enable;
  };

  config = lib.mkIf (cfg'.enable && cfg.enable) {
    home.packages = [ pkgs.hyprpicker ];
  };
}
