{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg' = config.elysium.developemnt;
  cfg = cfg'.sqlite;
in
{
  options.elysium.developemnt.sqlite.enable = lib.mkEnableOption "SQLite" // {
    default = cfg'.enable;
  };

  config = lib.mkIf cfg.enable // {
    home.packages = [ pkgs.sqlite ];
  };
}
