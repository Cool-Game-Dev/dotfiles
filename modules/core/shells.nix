{ config, lib, ... }:

let
  cfg = config.elysium.shells;
in
{
  options.elysium.shells.shells = {
    zsh.enable = lib.mkEnableOption "Zsh" // {
      default = lib.anyUserHasOption "elysium.shells.zsh.enable";
    };
  };

  config = {
    environment.shellAliases = lib.mkForce { };

    programs = {
      zsh.enable = lib.mkIf cfg.shells.zsh.enable true;
    };
  };
}