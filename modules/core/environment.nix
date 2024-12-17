{ config, pkgs, ... }:

{
  environment = {
    shells = with pkgs; [ zsh ];
    localBinInPath = true;
    extraInit = "umask 0077";
  };

  console = {
    colors = [
      "0c1225"
      "e3365e"
      "52eea3"
      "ffd85e"
      "437cf3"
      "c952ed"
      "51e1e9"
      "cccccc"
      "767676"
      "e74856"
      "16c60c"
      "f9f1a5"
      "1e6eeb"
      "e54f9b"
      "43cfea"
      "f2f2f2"
    ];
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  i18n.defaultLocale = "en_US.UTF-8";
  
  time.timeZone = "America/Chicago";
}
