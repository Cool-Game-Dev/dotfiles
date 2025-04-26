{
  config,
  ...
}:

{
  users.users."${config.hostSpec.username}" = {
    isNormalUser = true;
    home = "/home/${config.hostSpec.username}";
    group = "${config.hostSpec.username}";
    extraGroups = [
      "wheel"
      "video"
    ];
  };
}
