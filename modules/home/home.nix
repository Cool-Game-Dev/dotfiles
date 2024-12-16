{ config, pkgs, userSettings, zen-browser, ... } @ inputs:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = userSettings.username;
  home.homeDirectory = "/home/${userSettings.username}";

  nixpkgs.config.permittedInsecurePackages = [
     "dotnet-runtime-wrapped-6.0.36"
     "aspnetcore-runtime-6.0.36"
     "aspnetcore-runtime-wrapped-6.0.36"
     "dotnet-sdk-6.0.428"
     "dotnet-sdk-wrapped-6.0.428"
     "dotnet-runtime-6.0.36"
  ];

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.

  home.packages = with pkgs; [
    gh
    cava
    waybar
    unimatrix
    unzip
    # tagstudio # Flake doesn't work. Yell at Cyan and Xarvex for this later.
  ];

  nixpkgs.config.allowUnfree = true;
  programs.zsh.enable = true;

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = { };

  home.sessionVariables = { EDITOR = "micro"; };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
