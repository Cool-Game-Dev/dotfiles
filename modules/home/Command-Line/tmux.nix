{ config, pkgs, ... }:

{
  home.packages = [ pkgs.tmux ];

  programs.tmux = {
    enable = true;
    plugins = with pkgs.tmuxPlugins;
      [
        # tmux-resurrect
      ];
    prefix = "C-a";
  };
}
