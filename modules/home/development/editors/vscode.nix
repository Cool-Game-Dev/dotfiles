{ lib, pkgs, ... }:
let
  cfg' = config.elysium.developemnt.editors;
  cfg = cfg'.vscode;
in
{
  options.elysium.developemnt.editors.vscode.enable = lib.mkEnableOption "VSCode" // {
    default = cfg'.enable;
  };

  config = lib.mkIf cfg.enable { 
    home.packages = [ pkgs.vscode ];
  };
}
