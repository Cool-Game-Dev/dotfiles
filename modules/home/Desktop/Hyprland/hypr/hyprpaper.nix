{
  config,
  lib,
  pkgs,
  ...
}:

{
  home.packages = [ pkgs.hyprpaper ];
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "~/.dotfiles/wallpapers/stars.png" ];
      wallpaper = [ ",~/.dotfiles/wallpapers/stars.png" ];
    };
  };
}
