{
  inputs,
  username,
  zen-browser,
  ...
}:

{
  imports = [
    ./home.nix
    ./zsh.nix
    ./dolphin.nix
    ./zen-browser.nix
    ./bemoji.nix
    ./ente-auth.nix
    ./hypr
    ./fonts.nix
    ./p10k/p10k.nix
    ./fastfetch.nix
    ./bluedevil.nix
    ./godot.nix
    ./rofi/rofi.nix
    ./kcalc.nix
    ./jetbrains-toolbox.nix
    ./dotnet.nix
  ];
}
