{
  pkgs,
  ...
}:

{
  imports = [
    ./Art
    ./Development
    ./Internet
    ./Office
    ./System
    ./Utilities
    ./kde-apps.nix
  ];

  home.packages = [ pkgs.orca-slicer pkgs.freecad-wayland pkgs.vesktop ];
}
