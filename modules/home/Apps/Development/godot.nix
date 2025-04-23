{ master, ... }:

{
  home.packages = [
    master.godot_4-mono
    master.godot_4-export-templates
  ];
}
