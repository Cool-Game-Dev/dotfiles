{
  config,
  lib,
  pkgs,
  ...
}:

let 
  cfg' = config.elysium.desktops.hyprland;
  cfg = cfg'.hypridle;
in
{
  options.elysium.desktops.hyprland.hypridle.enable = lib.mkEnableOption "Hypridle" // {
    default = cfg'.enable;
  };

  config = lib.mkIf (cfg'.enable && cfg.enable) {
    home.packages = [ pkgs.hypridle ];
    services.hypridle = {
      enable = true;
      settings = {
        general = {
          lock_cmd = "pidof hyprlock || hyprlock";
          before_sleep_cmd = "loginctl lock-session";
          after_sleep_cmd = "hyprctl dispatch dpms on";
        };

        listener = [
          {
            timeout = 150; # 2.5min.
            on-timeout = "brightnessctl -s set 10";
            on-resume = "brightnessctl -r";
          }

          {
            timeout = 250;
            on-timeout = "loginctl lock-session";
          }

          {
            timeout = 330; # 5.5min
            on-timeout = "hyprctl dispatch dpms off";
            on-resume = "hyprctl dispatch dpms on";
          }
        ];
      };
    };
  };
}
