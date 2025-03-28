{
  inputs,
  username,
  zen-browser,
  ...
}:

{
  imports = [
    ./Apps
    ./Command-Line
    ./Desktop
    ./Input/compose.nix
    ./Development
    ./home.nix
    ./host-spec.nix
  ];
}
