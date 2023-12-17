{inputs, lib, config, pkgs, hyprland, ...} : {
  imports = [
    ./home.nix
    ./gui/firefox.nix
  ];


  home.packages = with pkgs; [
    tofi             # Application Launcher
    firefox          # Browser
    kitty            # Terminal
    hyprpaper        # Background
    brightnessctl    # Display brightness
    discord          # Chat
    wl-clipboard     # Clipboard
    grim             #
    slurp            #
    swappy           # Screenshot
  ];

  systemd.user.targets.hyprland-session.Unit.Wants = [ "xdg-desktop-autostart.target" ];

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

  # Chinese input method
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs;[
      fcitx5-rime
      fcitx5-configtool
      fcitx5-chinese-addons
      fcitx5-gtk
    ];
  };
}
