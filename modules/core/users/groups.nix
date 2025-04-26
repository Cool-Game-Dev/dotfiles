{
  config,
  ...
}:

{
  users.groups = {
    "${config.hostSpecusername}" = {
      gid = 1000;
    };
  };
}
