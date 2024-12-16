{ config, pkgs, ... }:

{
  environment.systemPackages = [ pkgs.greetd.greetd pkgs.greetd.tuigreet ];
  services.greetd = {
  	enable = true;
  	settings = {
	  default_session = {
	    command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland --theme='border=cyan;text=blue;prompt=blue;time=cyan;action=blue;button=yellow;container=black;input=magenta'";
	  };
  	};
  };
}
