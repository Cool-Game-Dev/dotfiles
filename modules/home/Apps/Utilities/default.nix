{ config, pkgs, ... }:

{
  imports = [ ./ente-auth.nix ./kcalc.nix ./merkuro.nix ./tagstudio.nix ];
}
