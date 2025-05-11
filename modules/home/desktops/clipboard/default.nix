{ config, lib, ... }: 

let
  cfg' = config.elysium.desktops.clipboard;
in
{
  imports = lib.elysium.scanPaths ./.;

  options.elysium.desktops.clipboard.enable = lib.mkEnableOption "Clipboard support" // {
    default = cfg'.enable;
  };
}