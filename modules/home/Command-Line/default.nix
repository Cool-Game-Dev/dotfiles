{ config, pkgs, ... }:

{
  imports = [
    ./cava.nix
    ./fastfetch/fastfetch.nix
    ./starship/starship.nix
    ./tmux.nix
    ./unimatrix.nix
    ./zsh.nix
  ];
}
