{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.nil
    pkgs.nixfmt-rfc-style
  ];
}
