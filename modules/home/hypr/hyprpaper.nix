{ config, lib, pkgs, ... }:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        "~/.dotfiles/wallpapers/wallpaper.jpg"
      ];
      wallpaper = [
        ",~/.dotfiles/wallpapers/wallpaper.jpg"
      ];
    };
  };
}
