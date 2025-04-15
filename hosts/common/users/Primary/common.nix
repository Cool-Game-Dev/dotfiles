{ config, inputs, lib, pkgs, ... }:

let
  hostSpec = config.hostSpec;
  inherit (hostSpec) username hostName;
  inherit pkgs inputs lib config;
  importWithArgs = path: import (lib.relativeToRoot path) { inherit pkgs inputs config lib hostSpec; };
in
{
  home-manager = {
    users.${username}.imports = lib.flatten [
      (importWithArgs "home/${username}/${hostName}.nix")
      (importWithArgs "modules/home")
    ];
  };
}
