{
  config,
  pkgs,
  zen-browser,
  ...
}:

{
  imports = [
    ./freetube.nix
    ./kde-connect.nix
    ./zen-browser.nix
  ];
}
