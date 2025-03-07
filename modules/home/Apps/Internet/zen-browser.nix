{ systemSettings, ... }@inputs:

{
  home.packages =
    [ inputs.zen-browser.packages."${systemSettings.system}".beta ];
}
