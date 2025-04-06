{
  config,
  pkgs,
  userSettings,
  ...
}:

{
  users = {
    defaultUserShell = pkgs.zsh;

    users."${userSettings.username}" = {
      isNormalUser = true;
      group = "${userSettings.username}";
      extraGroups = [
        "wheel"
        "video"
      ];
    };

    groups = {
      "${userSettings.username}" = {
        gid = 1000;
      };
    };
  };
}
