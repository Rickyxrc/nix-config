{ lib, ... }:
{
  programs.kitty = {
    enable = true;
    extraConfig = lib.fileContents ./kitty.conf;
  };

  home.file = {
    # ".config/kitty/everforest.conf".source = ./everforest.conf;
    ".config/kitty/tokyonight.conf".source = ./tokyonight.conf;
    # ".config/kitty/afterglow.conf".source = ./afterglow.conf;
    ".config/kitty/LuoTianyi2.jpeg".source = ../hyprland/hyprpaper/wallpapers/LuoTianyi2.jpeg;
  };
}
