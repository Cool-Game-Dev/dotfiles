{
  config,
  lib,
  self,
  ...
}:

{
  imports = [
    ./greetd
    ./sddm

    (self.lib.mkSelectorModule [ "elysium" "display-managers" ] {
      name = "provider";
      default = "greetd";
      description = "Display manager to use.";
    })
  ];

  options.elysium.display-managers.enable = lib.mkEnableOption "Display managers" // {
    default = config.dotfyls.desktops.enable;
  };
}
