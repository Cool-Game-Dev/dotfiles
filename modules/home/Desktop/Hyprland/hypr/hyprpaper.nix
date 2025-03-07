{ config, lib, pkgs, ... }:

{
  home.packages = [ pkgs.hyprpaper ];
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "~/.dotfiles/wallpapers/blacklotus-nix.png" ];
      wallpaper = [ ",~/.dotfiles/wallpapers/blacklotus-nix.png" ];
    };
  };
}
