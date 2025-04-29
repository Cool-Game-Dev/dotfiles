{ config, lib, pkgs, ... }:

let
  cfg' = config.elysium.development.dotnet.csharp;
  cfg = cfg'.csharprepl;
in 
{
  options.elysium.development.dotnet.csharp.repl.enable = lib.mkEnableOption "CSharp REPL" // {
    default = cfg'.enable;
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.csharprepl ];
  };
}