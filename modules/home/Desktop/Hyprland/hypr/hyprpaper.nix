{
  config,
  lib,
  pkgs,
  ...
}:

let 
  cfg' = config.elysium.desktops.hyprpaper;
  cfg = cfg'.hyprpaper;
in
{
  options.elysium.desktops.hyprland.hyprpaper.enable = lib.mkEnableOption "Hyprpaper" // {
    default = cfg'.enable;
  };

  config = lib.mkIf (cfg'.enable && cfg.enable) {
    home.packages = [ pkgs.hyprpaper ];
    services.hyprpaper = {
      enable = true;
      settings = {
        preload = [ "~/.dotfiles/wallpapers/blacklotus-nix.png" ];
        wallpaper = [ ",~/.dotfiles/wallpapers/blacklotus-nix.png" ];
      };
    };
  };
}
