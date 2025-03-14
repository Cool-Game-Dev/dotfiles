{ config, pkgs, ... }:

{
  imports = [
    ./docker.nix
    ./dotnet.nix
    ./git.nix
    ./nix.nix
    ./python.nix
    ./sqlite.nix
  ];
}
