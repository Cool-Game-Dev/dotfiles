{ config, lib, ... }:

{
  imports = lib.elysium.scanPaths ./.;

  options.dotfyls.shells.programs = {
    enableFun = lib.mkEnableOption "fun shell programs" // {
      default = config.dotfyls.terminals.enable;
    };
    enableUseful = lib.mkEnableOption "useful shell programs" // {
      default = true;
    };
  };
}