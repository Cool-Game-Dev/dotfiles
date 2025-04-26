{ config, ... }:

{
  networking = {
    hostName = config.config.hostSpechostName;
  };
}
