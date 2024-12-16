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
      system = "x86_64-linux";
      username = "Coolio";
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};

    in {
      nixosConfigurations = {
        Hydrus = lib.nixosSystem {
          inherit system;
          modules = [ ./modules/core ];
        };
      };

      homeConfigurations = {
        Coolio = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./modules/home ];
          extraSpecialArgs = { inherit zen-browser; inherit inputs; };
        };
      };
    };
}
