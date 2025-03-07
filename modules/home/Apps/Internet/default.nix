{ config, pkgs, zen-browser, ... }:

{
  imports = [ ./freetube.nix ./zen-browser.nix ];
}
