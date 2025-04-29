{ config, pkgs, ... }:

{
  imports = [
    ./cava.nix
    ./television.nix
    ./nix-search.nix
    ./fastfetch/fastfetch.nix
    ./starship/starship.nix
    ./tmux.nix
    ./unimatrix.nix
    ./zsh.nix
  ];
}
