{ pkgs, systemSettings, ... }@inputs: {
  imports = [ ./hyprland.nix ./hyprlock.nix ./hypridle.nix ./hyprpaper.nix ];

  home.packages = [
    pkgs.hyprshot
    pkgs.hyprpicker
    pkgs.hyprpolkitagent
    pkgs.playerctl
    pkgs.brightnessctl
    pkgs.wl-clipboard
    pkgs.cliphist
    pkgs.glib
    pkgs.wayland
    pkgs.direnv
    pkgs.pamixer
    pkgs.activate-linux
  ];

  systemd.user.targets.hyprland-session.Unit.Wants =
    [ "xdg-desktop-autostart.target" ];

}
