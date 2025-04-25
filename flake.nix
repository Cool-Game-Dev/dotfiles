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

    hyprland-qtutils = {
      url = "github:hyprwm/hyprland-qtutils";
      inputs.hyprland.follows = "nixpkgs";
    };

    git-hooks = {
      url = "github:cachix/git-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:/Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser.url = "github:0xc000022070/zen-browser-flake";

    tagstudio.url = "github:TagStudioDev/TagStudio/";
  };

  outputs =
    {
      self,
      nixpkgs,
      sops-nix,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      lib = nixpkgs.lib.extend (self: super: { custom = import ./lib { inherit (nixpkgs) lib; }; });

      forAllSystems = nixpkgs.lib.genAttrs [
        "x86_64-linux"
        # "aarch64-linux"
      ];

      vauxhall = import ./Vauxhall.nix;

    in
    {

      checks.pre-commit = forAllSystems (
        system:
        inputs.git-hooks.lib.${system}.run {
          src = ./.;
          hooks = {
            nixfmt-rfc-style.enable = true;
          };
        }
      );

      formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.nixfmt-rfc-style);

      nixosConfigurations =
        builtins.readDir ./hosts/nixos
        |> builtins.attrNames
        |> map (host: {
          name = host;
          value = nixpkgs.lib.nixosSystem {
            specialArgs = {
              inherit
                inputs
                outputs
                lib
                vauxhall
                ;
            };
            modules = [
              ./hosts/nixos/${host}
              ./modules/core
              ./hosts/common
              sops-nix.nixosModules.sops
            ];
          };
        })
        |> builtins.listToAttrs;
    };
}
