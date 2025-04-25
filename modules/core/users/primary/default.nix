{
  inputs,
  pkgs,
  master,
  config,
  lib,
  ...
}:
let
  hostSpec = config.hostSpec;
in
{
  users.users.${hostSpec.username} = {
    name = hostSpec.username;
  };
}
// lib.optionalAttrs (inputs ? "home-manager") {
  home-manager = {
    extraSpecialArgs = {
      inherit pkgs master inputs;
      hostSpec = config.hostSpec;
    };
    users.${hostSpec.username}.imports = lib.flatten (
      lib.optional (!hostSpec.isMinimal) [
        (
          { config, ... }:
          import (lib.relativeToRoot "home/${hostSpec.username}/${hostSpec.hostName}.nix")
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
