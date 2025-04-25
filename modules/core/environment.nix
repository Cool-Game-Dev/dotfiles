{
  config,
  pkgs,
  vauxhall,
  ...
}:

{
  environment = {
    localBinInPath = true;
    extraInit = "umask 0077";
  };

}
