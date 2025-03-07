{ inputs, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    appimage-run
    git
    killall
    btop
    micro-with-wl-clipboard
    kitty
    man
    ncdu
    gcc
  ];
}
