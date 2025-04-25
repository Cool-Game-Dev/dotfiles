{
  config,
  pkgs,
  hostSpec,
  ...
}:

{
  users = {
    defaultUserShell = pkgs.zsh;
  };
}
