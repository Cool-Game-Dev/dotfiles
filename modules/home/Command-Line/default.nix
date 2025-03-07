{ config, pkgs, ... }:

{
  imports =
    [ ./fastfetch/fastfetch.nix ./starship/starship.nix ./tmux.nix ./zsh.nix ];
}
