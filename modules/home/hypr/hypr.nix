{ pkgs, ... }:

{
  home.packages = with pkgs; [
    hyprshot
    hyprpicker
    wl-clipboard-rs
    wl-clip-persist
    glib
    wayland
    direnv
  ];

  systemd.user.targets.hyprland-session.Unit.Wants = [
      "xdg-desktop-autostart.target"
  ];
    
   wayland.windowManager.hyprland = {
     enable = true;
     xwayland = {
       enable = true;
       # hidpi = true;
     };
     systemd.enable = true;
   };
}
