{ config, lib, ... }:

let 
  cfg = config.elysium.services.gnome-keyring;
in
{
  options.elysium.gnome-keyring.enable = lib.mkEnableOption "Gnome Keyring" // {
    default = true;
  };

  config = lib.mkIf cfg.enable {
    services.gnome.gnome-keyring.enable = true;
    security.pam.services.login.enableGnomeKeyring = true;
  };
}