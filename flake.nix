{
  description = "Cool Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
  };

  outputs = { self, nixpkgs, home-manager, zen-browser, ... }: 
  let
    system = "x86_64-linux";
    lib = nixpkgs.lib;
    pkgs = nixpkgs.legacyPackages.${system};

    configFolder = import ./config/index.nix;
    modulesFolder = import ./modules/index.nix;
    
  in {
    nixosConfigurations = {
      Hydrus = lib.nixosSystem {
        inherit system;
        modules = modulesFolder ++ [ ./configuration.nix ];
      };
    };

    homeConfigurations = {
      Coolio = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = configFolder ++ [ ./home.nix ];
        extraSpecialArgs = { inherit zen-browser; };
      };
    };
  };
}
