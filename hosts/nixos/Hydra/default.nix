{ lib, ... }:
{
  imports = lib.elysium.scanPaths ./.;
  config.hostSpec = {
    isDesktop = true;
    hostname = "Hydra";
  };
}
