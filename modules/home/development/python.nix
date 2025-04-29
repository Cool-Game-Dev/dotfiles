{ config, pkgs, ... }:

let
  pythonPackages = with pkgs.python312Packages; [
    python
    pip
  ];

in
{
  home.packages = pythonPackages;
}
