{
  config,
  lib,
  self,
  ...
}:

let
  cfg = config.elysium.shells;
in
{
  imports = 
    (self.lib.mkSelectorModule [ "elysium" "shells" ] {
      name = "default";
      default = "zsh";
      description = "Default shell to use.";
    }) ++ lib.elysium.scanPaths ./.;

  options.dotfyls.shells = {
    historySize = lib.mkOption {
      type = lib.types.int;
      default = 256000;
      example = 128000;
      description = "Number of history lines.";
    };

    greet = lib.mkOption {
      type = lib.types.lines;
      default = "";
      example = lib.literalExpression ''
        ''${lib.getExe pkgs.fastfetch}
      '';
      description = ''
        Commands that should be run to greet the user.
        Note that these commands will run for any shell.
      '';
    };
  };

  config = {
    home = {
      sessionVariables.SHELL =
        let
          sCfg = cfg.shells.${cfg.default};
        in
        lib.mkIf (sCfg ? package) (self.lib.getCfgExe sCfg);
    };
  };
}
