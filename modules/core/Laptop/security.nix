{ config, ... }:

{
  security = {
    pam.services.login.enableGnomeKeyring = true;

    sudo.enable = false;

    sudo-rs = {
      enable = true;
      execWheelOnly = true;
    };
  };

  environment = {
    shellAliases = {
      sudo = "sudo-rs";
    };
  };
}
