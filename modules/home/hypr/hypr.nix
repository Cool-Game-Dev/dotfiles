{ pkgs, ... }:

{
  home.packages = with pkgs; [
    hyprshot
    hyprpicker
    hyprpolkitagent
    waybar
    swaynotificationcenter
    playerctl
    brightnessctl
    wl-clipboard-rs
    wl-clip-persist
    glib
    wayland
    direnv
    lyra-cursors
    pamixer
  ];

  systemd.user.targets.hyprland-session.Unit.Wants = [
    "xdg-desktop-autostart.target"
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
    };
   systemd.enable = true;
  };
}
