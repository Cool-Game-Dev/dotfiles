{ systemSettings, zen-browser, ... } @ inputs:

{
  home.packages = [ zen-browser.packages.${systemSettings.system}.specific ];
}
