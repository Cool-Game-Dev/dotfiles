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

  i18n.defaultLocale = "en_US.UTF-8";
}
