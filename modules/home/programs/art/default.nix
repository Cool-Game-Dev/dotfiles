{ config, lib, ... }:

let
  cfg = config.elysium.programs.art;
in
{
  options.elysium.programs.art.enable = lib.mkEnableOption "Art programs";
  imports = lib.scanPaths ./.;
}
