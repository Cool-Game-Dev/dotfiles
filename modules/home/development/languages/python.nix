{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg' = config.elysium.developemnt.languages;
  cfg = cfg'.python;

  pyPkgs = pkgs.python313;
in
{
  options.elysium.developemnt.languages.python.enable = lib.mkEnableOption "Python Dev" // {
    default = cfg'.enable;
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pyPkgs.python
      pyPkgs.pip
    ];
  };
}
