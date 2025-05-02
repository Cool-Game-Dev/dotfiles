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
      vauxhall.background.alpha
      vauxhall.hotRed.alpha
      vauxhall.green.alpha
      vauxhall.yellow.alpha
      vauxhall.blue.alpha
      vauxhall.purple.alpha
      vauxhall.cyan.alpha
      vauxhall.text.alpha
      vauxhall.gray.alpha
      vauxhall.red.alpha
      vauxhall.mint.alpha
      vauxhall.lightYellow.alpha
      vauxhall.cyan.alpha
      vauxhall.magenta.alpha
      vauxhall.coolCyan.alpha
      vauxhall.white.alpha
    ];
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  i18n.defaultLocale = "en_US.UTF-8";

  fonts.fontDir.enable = true;
}
