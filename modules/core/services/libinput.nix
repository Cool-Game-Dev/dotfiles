{
  config,
  lib,
  hostSpec,
  ...
}:

let
  cfg = config.elysium.services.libinput;
in
{
  options.elysium.services.libinput.enable = lib.mkEnableOption "libinput" // {
    default = hostSpec.isDesktop;
  };

  config = lib.mkIf cfg.enable {
    services.libinput.enable = true;
  };
}
