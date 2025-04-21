{ config, lib, ... }:

let 
  cfg = config.elysium.gvfs;
in
{
  options.elysium.gvfs.enable = lib.mkEnableOption "GVfs" // {
    default = true;
  };

  config = {
    services.gvsf.enable = cfg.enable;
  };
}