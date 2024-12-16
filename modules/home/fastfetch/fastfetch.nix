{ config, pkgs, ... }:

{

  home = {
    file.".config/fastfetch/config.jsonc".source = ./fastfetch.jsonc;
    packages = [ pkgs.fastfetch ];
  };
  programs.fastfetch.enable = true;
}
