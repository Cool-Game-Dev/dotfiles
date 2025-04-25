{
  hostSpec,
  ...
}:

{
  users.users."${hostSpec.username}" = {
    isNormalUser = true;
    home = "/home/${hostSpec.username}";
    group = "${hostSpec.username}";
    extraGroups = [
      "wheel"
      "video"
    ];
  };
}
