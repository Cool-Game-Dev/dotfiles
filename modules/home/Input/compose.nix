{ config, lib, ... }:

{
  home.sessionVariables.XCOMPOSEFILE = "${config.xdg.configHome}/.XCompose";

  home.file."${config.xdg.configHome}/.XCompose".source = ./.XCompose;
}
