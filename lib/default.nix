{ lib, ... }@inputs:
{
  relativeToRoot = lib.path.append ../.;

  scanPaths =
    path:
    builtins.readDir path
    |> lib.attrsets.filterAttrs (
      path: _type:
      (_type == "directory") # include directories
      || (
        (path != "default.nix") # ignore default.nix
        && (lib.strings.hasSuffix ".nix" path) # include .nix files
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
}
