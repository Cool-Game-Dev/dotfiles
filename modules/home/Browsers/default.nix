{ config, lib, ... }:

let
  cfg = config.elysium.browsers;

  desktopFiles = {
    zen-browser = "zen.desktop";
    firefox = "firefox.desktop";
  };

  defaultDesktopFile = desktopFiles.${cfg.default};

  otherDesktopFiles = lib.mapAttrsToList (name: _: desktopFiles.${name}) (
    lib.filterAttrs (name: browser: browser.enable && name != cfg.default) cfg.browsers
  );

in
{
  imports = [
    ./zen-browser
    ./firefox

    (lib.mkSelectorModule [ "browsers" ] {
      name = "default";
      default = "zen-browser";
      example = "firefox";
      description = "Default browser to use.";
    })
  ];

  options.browsers.enable = lib.mkEnableOption "browsers" // {
    default =  config.dotfyls.desktops.enable; 
  };

  config = lib.mkIf cfg.enable {
    mime-apps.web = lib.mkMerge [
      {
        email = defaultDesktopFile;
        webpage = defaultDesktopFile;
      }
      {
        email = lib.mkAfter otherDesktopFiles;
        webpage = lib.mkAfter otherDesktopFiles;
      }
    ];
  };
}