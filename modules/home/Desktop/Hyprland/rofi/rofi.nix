{ config, pkgs, vauxhall, ... }:

let
  inherit (config.lib.formats.rasi) mkLiteral;
in
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;

    theme = {
      "*" = {
        red = mkLiteral "rgba(220, 50, 47, 100%)";
        blue = mkLiteral "rgba(38, 139, 210, 100%)";

        foreground = mkLiteral "#cccccc";
        normal-foreground = mkLiteral "@foreground";
        urgent-foreground = mkLiteral "@foreground";
        active-foreground = mkLiteral "@foreground";
        selected-normal-foreground = mkLiteral "@normal-foreground";
        selected-urgent-foreground = mkLiteral "@urgent-foreground";
        selected-active-foreground = mkLiteral "@active-foreground";
        alternate-normal-foreground = mkLiteral "@normal-foreground";
        alternate-urgent-foreground = mkLiteral "@urgent-foreground";
        alternate-active-foreground = mkLiteral "@active-foreground";

        background = mkLiteral vauxhall.background.hex;
        lightbg = mkLiteral "#515768";
        normal-background = mkLiteral "@background";
        urgent-background = mkLiteral "@background";
        active-background = mkLiteral "@background";
        selected-normal-background = mkLiteral vauxhall.violet.hex;
        selected-active-background = mkLiteral "@selected-normal-background";
        selected-urgent-background = mkLiteral "@selected-normal-background";
        alternate-normal-background = mkLiteral "@normal-background";
        alternate-urgent-background = mkLiteral "@urgent-background";
        alternate-active-background = mkLiteral "@active-background";

        window-border-color = mkLiteral vauxhall.cyan.hex;
        border-color = mkLiteral vauxhall.cyan.hex;
        separatorcolor = mkLiteral vauxhall.background.hex;
        background-color = mkLiteral "rgba(0, 0, 0, 0%)";
      };

      "#window" = {
        background-color = mkLiteral "@background";
        border = mkLiteral "2";
        border-color = mkLiteral "@window-border-color";
        padding = mkLiteral "5";
      };

      "#mainbox" = {   
        background = mkLiteral "@background";
        padding = mkLiteral "0";
      };

      "#message" = {
        border = mkLiteral "2px 0px 0px";
        border-color = mkLiteral "@separatorcolor";
        padding = mkLiteral "1px";
      };

      "#textbox" = {
        text-color = mkLiteral vauxhall.blue.hex;
        border = mkLiteral "2px";
        border-color = mkLiteral "@border-color";
        margin = mkLiteral "3px";
      };

      "#listview" = {
        fixed-height = mkLiteral "0";
        border = mkLiteral "2px";
        border-color = mkLiteral "@border-color";
        spacing = mkLiteral "10px";
        scrollbar = mkLiteral "true";
        padding = mkLiteral "2px 0px 0px";
      };

      "#element" = {
        border = mkLiteral "0";
        padding = mkLiteral "2px";
      };

      "#element-text" = {
        background-color = mkLiteral "inherit";
        text-color = mkLiteral "inherit";
      };

      "#element.normal.normal" = {
        text-color = mkLiteral "@normal-foreground";
      };

      "#element.normal.urgent" = {
        text-color = mkLiteral "@urgent-foreground";
      };

      "#element.normal.active" = {
        text-color = mkLiteral "@active-foreground";
      };

      "#element.selected.normal" = {
        background-color = mkLiteral "@selected-normal-background";
        text-color = mkLiteral "@selected-normal-foreground";
        border-color = mkLiteral "@border-color";
        border = mkLiteral "2px";
      };

      "#element.selected.urgent" = {
        background-color = mkLiteral "@selected-urgent-background";
        text-color = mkLiteral "@selected-urgent-foreground";
      };

      "#element.selected.active" = {
        background-color = mkLiteral "@selected-active-background";
        text-color = mkLiteral "@selected-active-foreground";
      };

      "#element.alternate.normal" = {
        text-color = mkLiteral "@alternate-normal-foreground";
      };

      "#element.alternate.urgent" = {
        text-color = mkLiteral "@alternate-urgent-foreground";
      };

      "#element.alternate.active" = {
        text-color = mkLiteral "@alternate-active-foreground";
      };

      "#scrollbar" = {
        width = mkLiteral "4px";
        border = mkLiteral "0";
        handle-width = mkLiteral "8px";
        padding = mkLiteral "0";
      };

      "#mode-switcher" = {
        border = mkLiteral "2px 0px 0px";
        border-color = mkLiteral "@separatorcolor";
      };

      "#button.selected" = {
        background-color = mkLiteral "@selected-normal-background";
        text-color = mkLiteral "@selected-normal-foreground";
      };

      "#case-indicator" = {
        spacing = mkLiteral "0";
        text-color = mkLiteral "@normal-foreground";
      };

      "#entry" = {
        spacing = mkLiteral "0";
				text-color = mkLiteral vauxhall.blue.hex;
      };

      "#prompt" = {
        spacing = mkLiteral "0";
			 text-color = mkLiteral vauxhall.blue.hex;
      };

      "#inputbar" = {
        children = [
          "prompt"
          "textbox-prompt-colon"
          "entry"
          "case-indicator"
        ];

				border = mkLiteral "2px";
				border-color = mkLiteral "@border-color";
				text-color = mkLiteral vauxhall.blue.hex;
      };

      "#textbox-prompt-colon" = {
        expand = mkLiteral "false";
        str = ":";
        margin = mkLiteral "0px 0.3em 0em 0em";
				text-color = mkLiteral vauxhall.blue.hex;
      };
    };

    extraConfig = {
      "modes" = "window,drun,run,ssh";
      "font" =
        mkLiteral ''"JetBrains Mono Nerd Font Mono 14", "Twemoji Medium 14", "Noto Color Emoji Medium 14"'';
      "terminal" = "kitty";
      "show-icons" = true;
      "icon-theme" = "candy-icons";
    };
  };
}
