{ pkgs, systemSettings, ... }@inputs:
{

  home.packages = [
    pkgs.hyprpolkitagent
    pkgs.playerctl
    pkgs.brightnessctl
    pkgs.glib
    pkgs.pamixer
  ];
}
