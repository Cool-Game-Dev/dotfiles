{
  config,
  lib,
  pkgs,
  ...
}:

{

  home.pointerCursor = lib.optinalAttrs config.hostSpec.useWindowManager {
    name = "LyraP-cursors";
    package = pkgs.lyra-cursors;
    size = 36;
    gtk.enable = true;
    hyprcursor.enable = true;
    hyprcursor.size = 36;
  };
}
