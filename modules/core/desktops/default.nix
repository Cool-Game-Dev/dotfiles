{ lib, ... }:

{
  imports = [
    ./hyprland.nix
  ];

  options.dotfyls.desktops.enable = lib.mkEnableOption "desktops" // {
    default = lib.anyUserHasOption "elysium.desktops.enable";
  };

}
