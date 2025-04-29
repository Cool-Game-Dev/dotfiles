{ pkgs, ... }:

{
  home.packages = [
    pkgs.godot_4-mono
    pkgs.godot_4-export-templates
  ];
}
