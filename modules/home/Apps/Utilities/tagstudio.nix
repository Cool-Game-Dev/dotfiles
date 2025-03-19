{ inputs, pkgs, ... }:

{
  home.packages = [ (inputs.tagstudio.packages.${pkgs.system}.tagstudio) ];
}
