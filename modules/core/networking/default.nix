{ config, lib, ... }:

{

  networking = {
    hostName = config.hostSpec.hostName;
  };
}
