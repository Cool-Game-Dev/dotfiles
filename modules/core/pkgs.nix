{ inputs, pkgs, ... }:

# Basic apps that should be in all environments, no matter what
{
  environment.systemPackages = with pkgs; [
    git
    killall
    btop
    micro-with-wl-clipboard
    man
    ncdu
  ];
}
