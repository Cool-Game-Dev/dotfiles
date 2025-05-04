{ pkgs, ... }@inputs:

{
  imports = [ inputs.zen-browser.homeModules.beta ];
  
  home.packages = [ pkgs.firefox pkgs.ungoogled-chromium ];
  programs.zen-browser = {
    enable = true;

    policies = {
      DisableAppUpdate = true;
      DisableTelemetry = true;
    };
  };
}
