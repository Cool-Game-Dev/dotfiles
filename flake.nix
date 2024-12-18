{
  description = "Cool Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    
    home-manager = {
    	url = "github:nix-community/home-manager/master";
        inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    zen-browser.url = "github:MarceColl/zen-browser-flake";
    tagstudio.url = "github:TagStudioDev/TagStudio";
  };

  outputs = { self, nixpkgs, home-manager, zen-browser, ... } @ inputs:
    let
      
      systemSettings = {
        system = "x86_64-linux";
        hostName = "Hydrus";
      };

      userSettings = {
        username = "Coolio";
        name = "Coolio";
        dotfilesDir = "/home/${userSettings.username}/.dotfiles";
      };     
      pkgs = (import nixpkgs { system = systemSettings.system; });
      lib = inputs.nixpkgs.lib;
    in {
      nixosConfigurations = {
        "${systemSettings.hostName}" = lib.nixosSystem {
          system = systemSettings.system;
          modules = [ ./modules/core ];
          specialArgs = { 
            inherit systemSettings;
            inherit userSettings; 
          };
        };
      };

      homeConfigurations = {
        "${userSettings.username}" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./modules/home ];
          extraSpecialArgs = { 
            inherit zen-browser; 
            inherit inputs;
            inherit systemSettings;
            inherit userSettings; 
          };
        };
      };
    };
}
