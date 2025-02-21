{
  # Configure Hyprland
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";
      "$modShift" = "$mod SHIFT";

      # Monitor
      monitor = [
        "eDP-1,disable"
        "HDMI-A-1,1920x1080@60,0x0,1"
      ];

      # General
      general = {
        gaps_in = 3;
        gaps_out = 5;

        border_size = 2;
        "col.active_border" = "rgb(8fbcbb)";
        "col.inactive_border" = "rgb(2e3440)";

        layout = "dwindle";
      };

      # Decoration
      decoration = {
        rounding = 4;
        blur.enabled = false;
        shadow.enabled = false;
      };

      # Dwindle
      dwindle = {
        force_split = 2;
      };

      # Misc
      misc = {
        disable_hyprland_logo = true;
        force_default_wallpaper = 0;
        disable_splash_rendering = true;
      };

      # Animations
      animations = {
        enabled = true;
        animation = [
          "global, 1, 3, default"
          "windows, 1, 3, default, popin 87%"
          "workspaces, 0, 3, default"
        ];
      };

      # Keybinding
      bind = [
        # Launch apps
        "$mod, B, exec, firefox"
        "$mod, Return, exec, kitty"

        # Manage active window
        "$mod, Q, killactive"
        "$mod, F, togglefloating"

        # Switch to a workspace with $mod + num key
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"

        # Move active window to a workspace with $modShift + num key
        "$modShift, 1, movetoworkspacesilent, 1"
        "$modShift, 2, movetoworkspacesilent, 2"
        "$modShift, 3, movetoworkspacesilent, 3"
        "$modShift, 4, movetoworkspacesilent, 4"
        "$modShift, 5, movetoworkspacesilent, 5"
        "$modShift, 6, movetoworkspacesilent, 6"

        # Move focus with $mod + H / J / K / L key
        "$mod, H, movefocus, l"
        "$mod, J, movefocus, d"
        "$mod, K, movefocus, u"
        "$mod, L, movefocus, r"

        # Move active window with $modShift + H / J / K / L key
        "$modShift, H, movewindow, l"
        "$modShift, J, movewindow, d"
        "$modShift, K, movewindow, u"
        "$modShift, L, movewindow, r"

        # Cycle through workspaces with $mod + Comma / Period
        "$mod, Comma, workspace, e-1"
        "$mod, Period, workspace, e+1"

        # Change volume with $mod + N / M
        "$mod, N, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%-"
        "$mod, M, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
      ];
    };
  };
}
