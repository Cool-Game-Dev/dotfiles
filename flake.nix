{
  description = "Cool Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    stable.url = "nixpkgs/nixos-24.11";

    activate-linux.url = "github:MrGlockenspiel/activate-linux";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland-qtutils = {
      url = "github:hyprwm/hyprland-qtutils";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser.url = "github:0xc000022070/zen-browser-flake";

    tagstudio.url = "github:TagStudioDev/TagStudio/layout-refactor-1";
  };

  outputs = { self, nixpkgs, home-manager, zen-browser, ... }@inputs:
    let
      lib = inputs.nixpkgs.lib;

      systemSettings = {
        system = "x86_64-linux";
        hostName = "Hydrus";
        hostType = "laptop";

        modulePath = if systemSettings.hostType == "laptop" then
          ./modules/core/Laptop
        else if systemSettings.hostType == "homelab" then
          ./modules/core/Homelab
        else
          throw "Invalid hostType: ${systemSettings.hostType}";
      };

      userSettings = {
        username = "Coolio";
        name = "Coolio";
        dotfilesDir = "/home/${userSettings.username}/.dotfiles";
      };
      vauxhall = import ./Vauxhall.nix;
      pkgs = (import nixpkgs { system = systemSettings.system; });
      stable = (import stable { system = systemSettings.system; });

    in {
      nixosConfigurations = {
        "${systemSettings.hostName}" = lib.nixosSystem {
          system = systemSettings.system;
          modules = [ systemSettings.modulePath ];
          specialArgs = {
            inherit systemSettings;
            inherit userSettings;
            inherit vauxhall;
          };
        };
      };

      homeConfigurations = {
        "${userSettings.username}" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./modules/home ];
          extraSpecialArgs = {
            inherit inputs;
            inherit systemSettings;
            inherit userSettings;
            inherit vauxhall;
            inherit zen-browser;
          };
        };
      };
    };
}
