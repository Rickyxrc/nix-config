{ lib, pkgs, ... }: {
  imports = [
    ./home-gui.nix # GUI Applications
  ];

  home.packages = with pkgs; [
    rofi-wayland # Application Launcher
    hyprpaper # Background
    brightnessctl # Display brightness
    wl-clipboard # Clipboard
    # pipewire # Hyprland must-have
    # wireplumber # too
    xdg-desktop-portal-hyprland
    xdg-desktop-portal-gtk
    xdg-utils # xdg-open and more
  ];

  systemd.user.targets.hyprland-session.Unit.Wants = [ "xdg-desktop-autostart.target" ];

  xdg = {
    enable = true;
  };

  # Hyprland Basic Config
  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
    extraConfig = lib.fileContents ./gui/hyprland/primary/hyprland.conf;
  };
  home.file.".config/hypr/binds.conf".source = ./gui/hyprland/primary/binds.conf;
  home.file.".config/hypr/workspace.conf".source = ./gui/hyprland/primary/workspace.conf;

  # Hyprland Wallpaper Config
  home.file.".config/hypr/hyprpaper.conf".source = ./gui/hyprland/hyprpaper/hyprpaper.conf;
  home.file.".config/hypr/wallpaper" = {
    source = ./gui/hyprland/hyprpaper/wallpapers;
    recursive = true;
  };

  # Waybar config
  programs.waybar.enable = true;
  home.file.".config/waybar" = {
    source = ./gui/hyprland/waybar;
    recursive = true;
  };

  # Notifi daemon
  services.mako.enable = true;

  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [ wlrobs ];
  };
}
