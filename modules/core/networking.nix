{ config, systemSettings, ... }:

{
  networking = {
    networkmanager.enable =true;
    hostName = systemSettings.hostName;
  }; 
}
