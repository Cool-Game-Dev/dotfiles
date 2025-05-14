{ lib, ... }:

{
  imports = lib.elysium.scanPaths ./.;

  options.dotfyls.desktops.enable = lib.mkEnableOption "desktops" // {
    default = lib.anyUserHasOption "elysium.desktops.enable";
  };

}
