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

}
