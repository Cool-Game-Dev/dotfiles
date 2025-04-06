{ config, lib, ... }:

{
  options.hostSpec = {
    username = lib.mkOption {
      type = lib.types.str;
      description = "The username of the host admin";
      default = "Coolio";
    };

    hostName = lib.mkOption {
      type = lib.types.str;
      description = "The hostname of the host";
    };

    hardware = lib.mkOption {
      type = lib.types.attrs;
      default = { };
    };
  };
}
