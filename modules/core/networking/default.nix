{ config, ... }:

{
  networking = {
    hostName = config.hostSpec.hostName;
  };
}
