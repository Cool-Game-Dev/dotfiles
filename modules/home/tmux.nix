{ config, pkgs, ... }:

{
  home.packages = [ pkgs.tmux ];

  programs.tmux = {
  	plugins = with pkgs.tmuxPlugins; [
  	  tmux-resurrect
  	]
  }
}
