{ config, pkgs, userSettings, ... }@inputs:

{
  home = {
    username = userSettings.username;
    homeDirectory = "/home/${userSettings.username}";

    packages = with pkgs; [ unzip ];

    sessionVariables = { EDITOR = "micro"; };

    # Just don't change unless absolutly necessary
    stateVersion = "24.11"; # Please read the comment before changing.

    pointerCursor = {
      name = "LyraP-cursors";
      package = pkgs.lyra-cursors;
      size = 24;
      gtk.enable = true;
      hyprcursor.enable = true;
      hyprcursor.size = 24;
    };
  };

  programs.home-manager.enable = true;

  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [ "dotnet-sdk-6.0.428" ];
  };
}
