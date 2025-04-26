{
  config,
  ...
}:

{
  users.users."${config.hostSpecusername}" = {
    isNormalUser = true;
    home = "/home/${config.hostSpecusername}";
    group = "${config.hostSpecusername}";
    extraGroups = [
      "wheel"
      "video"
    ];
  };
}
