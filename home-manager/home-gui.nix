{inputs, lib, config, pkgs, hyprland, ...} : {
  imports = [
    ./home.nix
    ./gui/firefox.nix
  ];

  programs.waybar.enable = true;
  # services.mako.enable = true;
  home.packages = with pkgs; [ tofi firefox kitty hyprpaper ];

  systemd.user.targets.hyprland-session.Unit.Wants = [ "xdg-desktop-autostart.target" ];
  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
    extraConfig = ''
      $systemMod = SUPER # operate on window manage

      # Monitor
      monitor = ,highres,auto,auto
      exec-once = waybar
      # maco : notify-daemon
      # exec-once = mako

      # tofi : program launcher
      # exec-once = tofi
      bind = $systemMod, R, exec, tofi-drun | xargs hyprctl dispatch exec --
      bind = $systemMod, F, exec, firefox
      bind = $systemMod, K, exec, kitty
      bind = $systemMod, P, exit

      # wallpaper
      exec-once = hyprpaper

      # other config
      general {
        gaps_in = 6
        gaps_out = 12
        border_size = 1
        col.active_border = rgba(cceeffbb)
        col.inactive_border = rgba(595959ba)
      }

      decoration {
        rounding = 4
        # blur = yes
        # blur_size = 5
        # blur_passes = 1
        # blur_new_optimizations = on
        # drop_shadow = yes
        # shadow_range = 4
        # shadow_render_power = 3
        # col.shadow = rgba(1a1a1aee)
      }
    '';
  };

  home.file.".config/hypr/hyprpaper.conf".source = ./gui/hyprland/hyprpaper/hyprpaper.conf;

  home.file.".config/hypr/wallpaper" = {
    source = ./gui/hyprland/hyprpaper/wallpapers;
    recursive = true;
  };

  home.file.".config/waybar" = {
    source = ./gui/hyprland/waybar;
    recursive = true;
  };
}
