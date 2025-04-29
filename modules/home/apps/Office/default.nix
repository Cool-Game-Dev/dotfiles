{ config, pkgs, ... }:

{
  imports = [
    ./libreoffice.nix
    ./obsidian.nix
    ./okular.nix
  ];
}
