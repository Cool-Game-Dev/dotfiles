{ inputs, userSettings, ... }:

{
  imports = [
    ./eww/eww.nix
    ./hypr
    ./rofi/bemoji.nix
    ./rofi/rofi.nix
    ./swaync/swaync.nix
    ./waybar/waybar.nix
    ./xdg.nix
  ];
}
