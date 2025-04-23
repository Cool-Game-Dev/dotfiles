{
  description = "Cool Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    nixpkgs-master.url = "nixpkgs/master";

    activate-linux.url = "github:MrGlockenspiel/activate-linux";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland-qtutils = {
      url = "github:hyprwm/hyprland-qtutils";
      inputs.nixpkgs.follows = "nixpkgs";
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
      nixpkgs-master,
      home-manager,
      zen-browser,
      ...
    }@inputs:
    let
      lib = inputs.nixpkgs.lib;

      systemSettings = {
        system = "x86_64-linux";
        hostName = "Hydrus";
        hostType = "laptop";

        modulePath =
          if systemSettings.hostType == "laptop" then
            ./modules/core/Laptop
          else if systemSettings.hostType == "hommasterpkgselab" then
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
      pkgs = import nixpkgs { system = systemSettings.system; };
      master = import nixpkgs-master { system = systemSettings.system; };
    in
    {

      checks.pre-commit = inputs.git-hooks.lib.${systemSettings.system}.run {
        src = ./.;
        hooks = {
          nixfmt-rfc-style.enable = true;
        };
      };

      formatter.${systemSettings.system} = pkgs.nixfmt-rfc-style;

      nixosConfigurations = {
        "${systemSettings.hostName}" = lib.nixosSystem {
          system = systemSettings.system;
          modules = [ systemSettings.modulePath ];
          specialArgs = {
            inherit systemSettings;
            inherit userSettings;
            inherit vauxhall;
            inherit master;
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
            inherit master;
          };
        };
      };
    };
}
