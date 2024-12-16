{ config, pkgs, ... }:

{
  environment.systemPackages = [ pkgs.greetd.greetd pkgs.greetd.tuigreet ];

  services = {
    gvfs.enable = true;
    udisks2.enable = true;
    gnome.gnome-keyring.enable = true;
    printing.enable = true;
    
    pipewire = {
      enable = true;
      pulse.enable = true;
    };

    greetd = {
      enable = true;
      settings = {
        default_session = {
    	  command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland --theme='border=cyan;text=blue;prompt=blue;time=cyan;action=blue;button=yellow;container=black;input=magenta'";
    	};
      };
    };
    
    libinput.enable = true;
    logind.extraConfig = ''
      HandleLidSwitch=ignore
      HandleLidSwitchExternalPower=ignore
    '';

      openssh.enable = true;
  };

  location.provider = "geoclue2";
}
