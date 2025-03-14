{
  config,
  pkgs,
  vauxhall,
  ...
}:

{
  environment = {
    shells = with pkgs; [ zsh ];
    localBinInPath = true;
    extraInit = "umask 0077";
  };

  console = {
    colors = [
      "${vauxhall.background.alpha}"
      "${vauxhall.hotRed.alpha}"
      "${vauxhall.mint.alpha}"
      "${vauxhall.yellow.alpha}"
      "${vauxhall.blue.alpha}"
      "${vauxhall.purple.alpha}"
      "${vauxhall.cyan.alpha}"
      "${vauxhall.text.alpha}"
      "767676"
      "e74856"
      "16c60c"
      "f9f1a5"
      "1e6eeb"
      "e54f9b"
      "${vauxhall.coolCyan.alpha}"
      "f2f2f2"
    ];
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  i18n.defaultLocale = "en_US.UTF-8";
}
