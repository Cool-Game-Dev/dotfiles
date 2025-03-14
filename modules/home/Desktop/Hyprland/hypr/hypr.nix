{ pkgs, systemSettings, ... }@inputs:
{
  imports = [
    ./hyprland.nix
    ./hyprlock.nix
    ./hypridle.nix
    ./hyprpaper.nix
    ./hyprshot.nix
    ./hyprpicker.nix
  ];

  home.packages = [
    pkgs.hyprpolkitagent
    pkgs.playerctl
    pkgs.brightnessctl
    pkgs.wl-clipboard
    pkgs.glib
    pkgs.direnv
    pkgs.pamixer
    pkgs.activate-linux
  ];

  services.cliphist.enable = true;

  systemd.user.targets.hyprland-session.Unit.Wants = [ "xdg-desktop-autostart.target" ];

}
