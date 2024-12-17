{ config, pkgs, ... }:

{
  home.packages = [ pkgs.xdg-desktop-portal ];
  xdg = {
    enable = true;
  	userDirs = {
  	  enable = true;
  	  pictures ="${config.home.homeDirectory}/Media/Images";
  	  music ="${config.home.homeDirectory}/Media/Music";
  	  videos ="${config.home.homeDirectory}/Media/Music";
  	};

  	portal = {
 	  xdgOpenUsePortal = true;
 	  extraPortals = [
 	    pkgs.xdg-desktop-portal-hyprland
 	    pkgs.xdg-desktop-portal-kde
 	  ];
  	};
  };

  home.sessionVariables = {
    GTK_USE_PORTAL = 1;
    ZEN_ENABLE_WAYLAND = 1;
    MOZ_ENABLE_WAYLAND = 1;
  };
}
