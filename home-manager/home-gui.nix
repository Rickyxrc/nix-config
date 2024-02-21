{ pkgs, inputs, ... }: {
  imports = [
    ./home.nix # Basic environments
    ./gui/firefox # Browser 
    ./gui/kitty # Terminal emulator
    ./gui/pylauncher # Simple Launcher(active environment and start neovide.)
    ./gui/fcitx5 # Fcitx config and themes
  ];

  home.packages = with pkgs; [
    discord # Chat Tool
    neovide # neovim animated
    paprefs # controls audio output
    pavucontrol # controls audio output
    wineWowPackages.stable # wine
    grim # Screen shot
    winetricks # Wine helper
    musescore # Midi file editor
    hmcl # Minecraft launcher
    notify-desktop # send notify
    veracrypt # Encrypt software
    thunderbird # Mail app
    wpsoffice # EVERY ONE KNOWS
  ] ++ [
    inputs.nix-gaming.packages.${pkgs.system}.osu-lazer-bin
    # inputs.nix-gaming.packages.${pkgs.system}.wine-tkg
  ];
}
