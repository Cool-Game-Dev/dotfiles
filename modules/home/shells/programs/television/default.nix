{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg' = config.shells.programs;
  cfg = cfg'.tv;
in
{
  options.elysium.shells.programs.tv.enable = lib.mkEnableOption "television" // {
    default = cfg'.enableUseful || cfg'.enableFun;
  };

  config = lib.mkIf cfg.enable {
    programs.television.enable = true;
  };
}
