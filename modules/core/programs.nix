{ lib, ... }:

{
  programs = {
    ssh.startAgent = true;
    zsh.enable = true;
  };
}
