{ config, lib, pkgs, ... }:

let 
  cfg' = config.elysium.development;
  cfg = cfg'.dotnet;
in
{
  options.elysium.development.dotnet.enable = lib.mkEnableOption "Dotnet" // {
    default = cfg'.enable;
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.dotnetCorePackages.sdk_9_0 ];
  };
}
