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
  users.users.${config.hostSpecusername} = {
    name = config.hostSpecusername;
  };
}
// lib.optionalAttrs (inputs ? "home-manager") {
  home-manager = {
    extraSpecialArgs = {
      inherit pkgs master inputs;
      hostSpec = config.hostSpec;
    };
    users.${config.hostSpecusername}.imports = lib.flatten (
      lib.optional (!config.hostSpecisMinimal) [
        (
          { config, ... }:
          import (lib.relativeToRoot "home/${config.hostSpecusername}/${config.hostSpechostName}.nix")
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
