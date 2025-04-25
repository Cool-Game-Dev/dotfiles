{
  config,
  lib,
  ...
}:

let
  cfg = config.dotfyls.desktops;
in
{
  imports = [
    ./Hyprland

    (lib.mkSelectorModule [ "elysium" "desktops" ] {
      name = "default";
      default = "hyprland";
      example = "hyprland";
      description = "Default desktop to use.";
    })
  ];

  options.elysium.desktops = {
    enable = lib.mkEnableOption "desktops" // {
      default = true;
    };

  };

  config = lib.mkIf cfg.enable {
    xdg.portal.xdgOpenUsePortal = true;
  };

}
