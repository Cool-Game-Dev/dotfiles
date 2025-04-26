{ config, ... }:

{
  networking = {
    hostName = config.config.hostSpec.hostName;
  };
}
