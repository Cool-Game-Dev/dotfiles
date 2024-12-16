{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  nix.gc = {
    automatic = true;
    dates = "Sat 12:00";
  };

  # Just don't change unless absolutly necessary
  system.stateVersion = "24.11"; # Did you read the comment?
}
