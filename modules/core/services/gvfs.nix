{ config, lib, ... }:

let
  cfg = config.elysium.services.gvfs;
in
{
  options.elysium.gvfs.enable = lib.mkEnableOption "GVfs" // {
    default = true;
  };

  config = lib.mkIf cfg.enable {
    services.gvsf.enable = true;
  };
}
