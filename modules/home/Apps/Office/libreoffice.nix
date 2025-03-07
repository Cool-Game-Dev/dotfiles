{ config, pkgs, ... }:

{
  home.packages = [ pkgs.libreoffice-qt6-fresh pkgs.hunspell ];
}
