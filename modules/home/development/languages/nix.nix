{ config, lib, pkgs, ... }:

let
  cfg' = config.elysium.developemnt.languages;
  cfg = cfg'.nix;
in
{
  options.elysium.developemnt.languages.nix.enable = lib.mkEnableOption "Nix Dev" // {
    default = cfg'.enable;
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.nixd
      pkgs.manix
    ];
  };
}
