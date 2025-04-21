{
  config,
  lib,
  pkgs,
  ...
}:

{

  services = {
    gnome.gnome-keyring.enable = true;
    printing.enable = true;
    automatic-timezoned.enable = lib.mkDefault true;
    timesyncd.enable = true;

    libinput.enable = true;
    logind.lidSwitch = "ignore";

    openssh.enable = true;
    tailscale.enable = true;
  };

  location.provider = "geoclue2";
}
