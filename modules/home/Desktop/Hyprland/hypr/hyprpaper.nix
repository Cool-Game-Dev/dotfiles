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
      preload = [ "~/.dotfiles/wallpapers/stars.jpg" ];
      wallpaper = [ ",~/.dotfiles/wallpapers/stars.jpg" ];
    };
  };
}
