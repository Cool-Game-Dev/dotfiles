{ config, pkgs, zen-browser, ... }:

{
  imports = [ ./godot.nix ./jetbrains-toolbox.nix ./vscode.nix ];
}
