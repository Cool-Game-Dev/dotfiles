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

    zen-browser.url = "github:0xc000022070/zen-browser-flake";

    tagstudio.url = "github:TagStudioDev/TagStudio/";
  };

  outputs =
    {
      self,
      nixpkgs,
      ...
    }@inputs:
    let
      inherit (nixpkgs) lib;
      inherit (self) outputs;

      forAllSystems = nixpkgs.lib.genAttrs [
        "x86_64-linux"
        # "aarch64-linux"
      ];

      systemSettings = {
        system = "x86_64-linux";
        hostName = "Hydrus";
        hostType = "laptop";
      };

      userSettings = {
        username = "Coolio";
        name = "Coolio";
        dotfilesDir = "/home/${userSettings.username}/.dotfiles";
      };
      vauxhall = import ./Vauxhall.nix;

      pkgs = forAllSystems (system: import nixpkgs { inherit system; } );
      stable = forAllSystems (system: import stable { inherit system; } );

      mkHost = host: {
        ${host} =
          let
            func = lib.nixosSystem;
            systemFunc = func;
          in
          systemFunc {
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
              ./modules
            ];
          };
      };

      mkHostConfigs =
        hosts: lib.foldl (acc: set: acc // set) { } (lib.map (host: mkHost host) hosts);
      readHosts = folder: lib.attrNames (builtins.readDir ./hosts/${folder});

    in
    {

      checks.pre-commit = inputs.git-hooks.lib.${systemSettings.system}.run {
        src = ./.;
        hooks = {
          nixfmt-rfc-style.enable = true;
        };
      };

      formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.nixfmt-rfc-style);

      nixosConfigurations = readHosts "nixos";
    };
}
