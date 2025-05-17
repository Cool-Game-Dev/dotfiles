{ config, lib, ... }:

let
  cfg' = config.elysium.desktops;
  cfg = cfg'.desktops.hyprland;
in
{
  options.dotfyls.desktops.desktops.hyprland = {
    enable = lib.mkEnableOption "Hyprland" // {
      default = lib.elysium.anyUserHasOption "elysium.desktops.desktops.hyprland.enable";
    };
  };

  config = lib.mkIf (cfg'.enable && cfg.enable) {
    programs.hyprland.enable = true;
  };
}
