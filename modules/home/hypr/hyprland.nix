{ config, inputs, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$terminal" = "kitty";
      "$fileManager" = "dolphin";
      "$browser" = "zen";
      "$menu" = "rofi -show drun";

      exec-once = [
        "hyprpaper"
        "swaync"
        "waybar"
        "systemctl --user start hyprpolkitagent"
        "hypridle"
     
        # Apps
        "[workspace 1 silent] $terminal"
        "[workspace 2 silent] $browser"
      ];

      input = {
        kb_layout = "us";
        kb_variant = "";
        kb_model = "";
        kb_options = "";
        kb_rules = "";
        follow_mouse = 1;

        sensitivity = 0; # -1.0 - 1.0, 0 means no modification.

        touchpad = {
          natural_scroll = true;
          clickfinger_behavior = true;
        };
      };

      misc = {
        disable_autoreload = true;
        disable_hyprland_logo = true;
        always_follow_on_dnd = true;
        layers_hog_keyboard_focus = true;
        animate_manual_resizes = false;
        enable_swallow = true;
        focus_on_activate = true;
        new_window_takes_over_fullscreen = 2;
        middle_click_paste = false;
      };

      # https://wiki.hyprland.org/Configuring/Variables/#gestures
      gestures = { workspace_swipe = true; };

      # https://wiki.hyprland.org/Configuring/Variables/#general
      general = {
        gaps_in = "4";
        gaps_out = "0, 8, 8, 8";

        border_size = 1;

        # https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
        "col.active_border" = 
          "rgb(51e1e9) rgb(51e1e9) rgb(6f51f4) rgb(9446f8) 45deg";
        "col.inactive_border" = "rgb(515768)";

        # Set to true enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false;

        # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
        allow_tearing = false;
      };

      dwindle = {
        pseudotile =
          true; # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = true; # You probably want this
        smart_split = true;
      };

      # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
      master = { new_status = "master"; };

      decoration = {
        rounding = 10;

        # Change transparency of focused and unfocused windows
        active_opacity = 1.0;
        inactive_opacity = 1.0;

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;

          color = "rgba(1a1a1aee)";
        };

        # https://wiki.hyprland.org/Configuring/Variables/#blur
        blur = {
          enabled = true;
          ignore_opacity = true;
          size = 3;
          passes = 2;
          noise = 0;
          vibrancy = 0.1696;
        };
      };

      animations = {
        enabled = true;

        # Default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more
        bezier = [
          "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1.0"
          "quick,0.15,0,0.1,1"
        ];

        animation = [
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 1.94, easeInOutCubic, slide"
          "workspacesIn, 1, 1.21, easeInOutCubic, slidefade 50%"
          "workspacesOut, 1, 1.94, easeInOutCubic, slidefade 50%"
        ];
      };

      "$mainMod" = "SUPER";
      "$shiftMod" = "SUPER + SHIFT";
      "$ctrlMod" = "SUPER + CTRL";
      "$altMod" = "SUPER + ALT";
      "$ctrlShiftMod" = "SUPER + CTRL_SHIFT";
      "$altShiftMod" = "SUPER + CTRL_ALT";

      bind = [
        # Program binds
        "$mainMod, RETURN, exec, $terminal"
        "$mainMod, B, exec, $browser"
        "$mainMod, E, exec, $fileManager"
        "$shiftMod, return, exec, $menu"
        "$mainMod, PERIOD, exec, bemoji --private -c -n"
        "$shiftMod, C, exec, hyprpicker --autocopy"
        "$altShiftMod, C, exec, hyprpicker --fmt=rgb --autocopy" 
        "$shiftMod, L, exec, hyprlock"

        ", PRINT, exec, hyprshot -m output -o ~/Media/Images"
        "$mainMod, PRINT, exec, hyprshot -m window -o ~/Media/Images"
        "$shiftMod, PRINT, exec, hyprshot -m region -o ~/Media/Images"

        # Manage layout

        "$shiftMod, P, pseudo," # dwindle
        "$mainMod, J, togglesplit," # dwindleb
        "$mainMod, V, togglefloating,"


        # Kill the selected window with Mod + Q
        
        "$mainMod, Q, killactive,"

		# Change window focus with Mod + Arrow Keys
		
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        # Swap windows with Alt + Mod + Arrow Keys

        "$altMod, left, swapwindow, l"
        "$altMod, right, swapwindow, r"
        "$altMod, up, swapwindow, u"
        "$altMod, down, swapwindow, d"
        # Move to workspace with Mod + [0-9]

        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

		# Move window to workspace with  Shift + Mod + [0-9]

        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        # Special workspace 'hidden', for whatever windows you need open but don't want to see

        "$mainMod, S, togglespecialworkspace, hidden"
        "$shiftMod, S, movetoworkspace, special:hidden"

        # Special workspace 'notebook', keep track of notes, write things down for later, etc
        
        "$mainMod, N, togglespecialworkspace, notebook"
        "$shiftMod, N, movetoworkspace, special:notebook"
        
        # Close hyprland with Mod + M

        "$shiftMod, escape, exit,"
      ];


      binde = [
        # Resize windows by 10 pixels with Ctrl + Mod + Arrow Keys
        "$ctrlMod, left, resizeactive, -10 0"
        "$ctrlMod, right, resizeactive, 10 0"
        "$ctrlMod, up, resizeactive, 0 -10"
        "$ctrlMod, down, resizeactive, 0 10"

		 # Resize windows by 1 pixel with Ctrl + Shift + Mod and arrow keys
        "$ctrlShiftMod, left, resizeactive, -1 0"
        "$ctrlShiftMod, right, resizeactive, 1 0"
        "$ctrlShiftMod, up, resizeactive, 0 -1"
        "$ctrlShiftMod, down, resizeactive, 0 1"
      ];

      bindm = [
        # Manage windows with mainMod + mouse
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      bindel = [
        # Change volume by 5% with Volume Keys
        ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"

        # Change volume by 1% with Shift + Volume Keys
        "SHIFT, XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%+"
        "SHIFT, XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-"

        # Change microphone volume by 5% with Alt + Volume Keys
        "ALT, XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 5%+"
        "ALT, XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 5%-"
        
        # Change microphone volume by 1% with Shift + Alt + Volume Keys
        "SHIFT_ALT, XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 1%+"
        "SHIFT_ALT, XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 1%-"

        # Mute with Mute Key
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

        # Mute mic with Alt + Mute Key
        "Alt, XF86AMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"

        # Change brightness with brightness keys
        ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
        ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
      ];

      bindl = [
        # Manage media with media keys
        ", XF86AudioPrev, exec, playerctl previous"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        
      ];

      windowrulev2 = [
        "suppressevent maximize, class:.*"
        "float, class:org.freedesktop.impl.portal.desktop.kde"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      ];

      # Persist the shell and browser workspaces
      workspace = [ "1, persistent:1" "2, persistent:1" ];
    };

    extraConfig = ''
      monitor=,preferred,auto,auto 

      xwayland {
        force_zero_scaling = true
      }
      '';
    systemd.enable = true;
  };
}
