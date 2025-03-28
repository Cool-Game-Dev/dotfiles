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

    useWindowManager = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Used to indicate a host that uses a window manager";
    };
  };
}
