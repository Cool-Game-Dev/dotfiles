{ config, ... }:

{
  programs = {
    hyprland.enable = true;
    ssh.startAgent = true;
    zsh.enable = true;
  };

}
