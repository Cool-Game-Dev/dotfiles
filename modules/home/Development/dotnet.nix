{ config, pkgs, ... }:

{
  home.packages = [ pkgs.dotnetCorePackages.sdk_9_0 ];
}
