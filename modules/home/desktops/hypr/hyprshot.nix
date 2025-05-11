{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg'' = config.elysium.desktops;
  cfg' = cfg''.hypr;
  cfg = cfg'.shot;
in
{
  options.elysium.desktops.hyprland.hyprshot.enable = lib.mkEnableOption "Hyprshot" // {
    default = cfg'.enable;
  };

  config = lib.mkIf (cfg''.enable && cfg'.enable && cfg.enable) {
    home.packages = [ pkgs.hyprshot ];
  };
}
