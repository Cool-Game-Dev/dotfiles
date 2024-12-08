{ inputs, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    zsh
    git
    killall
    btop
  	micro
  	kitty
  	hyprland
  	hyprpaper
  	hyprlock
  	hypridle
  	hyprshot
  	rofi
  	waybar
  ];	
}
