{
  config,
  lib,
  hostSpec,
  ...
}:

{
  users.groups = {
    "${hostSpec.username}" = {
      gid = 1000;
    };
  };
}
