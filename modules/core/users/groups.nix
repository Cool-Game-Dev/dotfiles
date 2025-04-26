{
  config,
  ...
}:

{
  users.groups = {
    "${config.hostSpec.username}" = {
      gid = 1000;
    };
  };
}
