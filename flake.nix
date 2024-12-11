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
    username = "Coolio";
    lib = nixpkgs.lib;
    pkgs = nixpkgs.legacyPackages.${system};
    
  in {
    nixosConfigurations = {
      Hydrus = lib.nixosSystem {
        inherit system;
        modules =[ ./modules/core ];
      };
    };

    homeConfigurations = {
      Coolio = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./modules/home ];
        extraSpecialArgs = { inherit zen-browser; };
      };
    };
  };
}
