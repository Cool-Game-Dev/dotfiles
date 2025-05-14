{ config, lib, ... }:

{
  imports = lib.elysium.scanPaths ./.;
  networking = {
    hostName = config.config.hostSpec.hostName;
  };
}
