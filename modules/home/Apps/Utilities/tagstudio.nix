{ inputs, pkgs, ... }:

{
  home.packages = [ (inputs.tagstudio.packages.${pkgs.system}.tagstudio) ];

  xdg.desktopEntries."TagStudio" = {
    exec = "tagstudio";
    name = "TagStudio";
  };
}
