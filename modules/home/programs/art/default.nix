{ config, lib, ... }:

let
  cfg = config.elysium.programs.art;
in
{
  imports = lib.scanPaths ./.;
}
