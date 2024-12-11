{ zen-browser, ... }@inputs:

{
  home.packages = [ zen-browser.packages."x86_64-linux".specific ];
}
