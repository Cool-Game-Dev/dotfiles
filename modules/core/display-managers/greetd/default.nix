{
  config,
  lib,
  self,
  ...
}:

let
  cfg' = config.elysium.display-managers;
  cfg = cfg'.display-managers.greetd;
in
{
  imports =
    (self.lib.mkSelectorModule [ "elysium" "display-managers" "display-managers" "greetd" "greeter" ] {
      name = "provider";mkSelect
      default = "tuigreet";
      description = "Greeter to use for greetd.";
    }) ++ lib.elysium.scanPaths ./.;

  options.elysium.display-managers.display-managers.greetd.enable = lib.mkEnableOption "greetd";

  config = lib.mkIf (cfg'.enable && cfg.enable) {
    services.greetd.enable = true;
  };
}
