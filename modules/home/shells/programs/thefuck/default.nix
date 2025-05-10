{ config, lib, ... }:

let
  cfg' = config.elysium.shells.programs;
  cfg = cfg'.thefuck;
in
{
  options.elysium.shells.programs.thefuck.enable = lib.mkEnableOption "The Fuck" // {
    default = cfg'.enableFun || cfg'.enableUseful;
  };

  config = lib.mkIf cfg.enable {
    programs.thefuck.enable = true;
  };
}
