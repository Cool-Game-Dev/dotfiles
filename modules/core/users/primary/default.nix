{
  inputs,
  pkgs,
  master,
  config,
  lib,
  ...
}:
let
  hostSpec = config.hostSpec.;
in
{
  users.users.${config.hostSpec.username} = {
    name = config.hostSpec.username;
  };
}
// lib.optionalAttrs (inputs ? "home-manager") {
  home-manager = {
    extraSpecialArgs = {
      inherit pkgs master inputs;
      hostSpec = config.hostSpec.;
    };
    users.${config.hostSpec.username}.imports = lib.flatten (
      lib.optional (!config.hostSpec.isMinimal) [
        (
          { config, ... }:
          import (lib.relativeToRoot "home/${config.hostSpec.username}/${config.hostSpec.hostName}.nix")
            {
              inherit
                pkgs
                inputs
                config
                lib
                hostSpec
                ;
            }

            import
            (lib.relativeToRoot "/modules/home")
            {
              inherit
                pkgs
                inputs
                config
                lib
                hostSpec
                ;
            }
        )
      ]
    );
  };
}
