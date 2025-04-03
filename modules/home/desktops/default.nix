{
  inputs,
  userSettings,
  ...
}:

let 
  cfg = config.dotfyls.desktops;
in
{
  imports = [
    ./Hyprland

    (self.lib.mkSelectorModule [ "dotfyls" "desktops" ] {
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

  }

  config = {
    xdg.portal.xdgOpenUsePortal = true;
  }

}
