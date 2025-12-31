{ pkgs, ... }:
{
  imports = [
    ./home.nix # Basic environments
    ./gui/kitty # Terminal emulator
    ./gui/fcitx5 # Fcitx config and themes
  ];

  home.packages =
    with pkgs;
    [
      # discord # Chat Tool
      # winetricks # Wine helper
      # musescore # Midi file editor
      # hmcl # Minecraft launcher
      # notify-desktop # send notify
      # veracrypt # Encrypt software
      # thunderbird # Mail app
      # wpsoffice # EVERY ONE KNOWS
      # obsidian # note taking app
      # chromium # chrome browser
      # ungoogled-chromium
      # notion-app-enhanced
    ]
    ++ [
      # inputs.nix-gaming.packages.${pkgs.system}.osu-lazer-bin
      # inputs.nix-gaming.packages.${pkgs.system}.wine-tkg
    ];
}
