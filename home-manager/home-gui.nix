{inputs, lib, config, pkgs, hyprland, ...} : {
  imports = [
    ./home.nix
    ./gui/firefox.nix
  ];

  programs.waybar.enable = true;
  # services.mako.enable = true;
  home.packages = with pkgs; [ tofi firefox kitty hyprpaper brightnessctl ];

  systemd.user.targets.hyprland-session.Unit.Wants = [ "xdg-desktop-autostart.target" ];
  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
    extraConfig = ''
      $systemMod = SUPER # operate on window manage

      # Monitor
      # monitor = eDP-1,2560x1440@120,auto
      # monitor = DP-2,1920x1080@60,auto

      exec-once = waybar
      # maco : notify-daemon
      # exec-once = mako

      # wallpaper
      exec-once = hyprpaper

      # other config
      general {
        gaps_in = 6
        gaps_out = 12
        # border_size = 1
        # col.active_border = rgba(cceeffbb)
        # col.inactive_border = rgba(595959ba)
      }

      decoration {
        rounding = 4
        blur {
          enabled = true
          size = 3
          passes = 1
          vibrancy = 0.1696
        }
        # blur = yes
        # blur_size = 5
        # blur_passes = 1
        # blur_new_optimizations = on
        # drop_shadow = yes
        # shadow_range = 4
        # shadow_render_power = 3
        # col.shadow = rgba(1a1a1aee)
      }

      # load workspace conf
      source = ./workspace.conf

      # load keyboard binds
      source = ./binds.conf      
    '';
  };

  home.file.".config/hypr/binds.conf".source = ./gui/hyprland/binds.conf;
  home.file.".config/hypr/workspace.conf".source = ./gui/hyprland/workspace.conf;

  home.file.".config/hypr/hyprpaper.conf".source = ./gui/hyprland/hyprpaper/hyprpaper.conf;

  home.file.".config/hypr/wallpaper" = {
    source = ./gui/hyprland/hyprpaper/wallpapers;
    recursive = true;
  };

  home.file.".config/waybar" = {
    source = ./gui/hyprland/waybar;
    recursive = true;
  };

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs;[
      # fcitx5-mozc
      # fcitx5-gtk
      fcitx5-rime
      fcitx5-configtool
      fcitx5-chinese-addons
      fcitx5-gtk
    ];
    # enabled = "ibus";
    # ibus.engines = with pkgs.ibus-engines; [
    #  libpinyin
    #  rime
    # ];
  };
}
