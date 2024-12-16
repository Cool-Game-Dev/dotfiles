{ config, pkgs, ... }:

{
  users = {
    defaultUserShell = pkgs.zsh;
    
    users.Coolio = {
      isNormalUser = true;
      group = "Coolio";
      extraGroups = [ "wheel" "video" ];
    };
    
    groups = {
      Coolio = { };
    };
  };
}
