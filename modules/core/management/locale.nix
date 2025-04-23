{ config, lib, ... }: 

{
  i18n = {
    defaultLocale = "en_US.UTF-8";

    supportedLocales = [
      "C.UTF-8"
      "en_US.UTF-8"
      config.i18n.defaultLocale
    ] ++ (
      config.i18n.extraLocaleSettings
      |> builtins.removeAttrs [ "LANGUAGE" ]
      |> builtins.attrValues
    )
    |> map (locale:
      builtins.replaceStrings
        [ "utf8" "utf-8" "UTF8" ]
        [ "UTF-8" "UTF-8" "UTF-8" ]
        locale + "/UTF-8"
    )
    |> lib.unique;
  };
}
