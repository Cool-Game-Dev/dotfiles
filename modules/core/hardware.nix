{ hostSpec, ... }:

{
  hardware = {
    bluetooth.enable = hostSpec.bluetooth.enable;
  };
}
