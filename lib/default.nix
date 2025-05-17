{ lib, ... }@inputs:
{
  imports = lib.scanPaths ./.;

  relativeToRoot = lib.path.append ../.;

  scanPaths = path:
    builtins.readDir path
    |> lib.attrsets.filterAttrs (
      name: type:
        (type == "directory") || (
          (name != "default.nix") &&
          (lib.strings.hasSuffix ".nix" name)
        )
    )
    |> builtins.attrNames
    |> builtins.map (f: "${path}/${f}");

  anyUserHasOption =
    optionPathStr:
    let
      path = lib.splitString "." optionPathStr;
      users = inputs.home-manager.users;
    in
    lib.any (userCfg: lib.attrByPath path false userCfg) (lib.attrValues users);

  mkSelectorModule =
    path: selectionOption:
    { config, ... }:
    {
      options = lib.setAttrByPath path {
        ${selectionOption.name} = lib.mkOption {
          type = lib.types.enum (builtins.attrNames (lib.getAttrFromPath path config).${lib.last path});
          inherit (selectionOption) default description;
        };
      };

      config = lib.setAttrByPath (
        path
        ++ [
          (lib.last path)
          (lib.getAttrFromPath path config).${selectionOption.name}
        ]
      ) { enable = lib.mkDefault true; };
    };
} // lib.mergeAttrsList [
  (import ./options.nix { inherit lib; })
]
