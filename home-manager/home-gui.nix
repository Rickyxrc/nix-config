{pkgs, inputs, ...} : {
    imports = [
        ./home.nix        # Basic environments
        ./gui/firefox     # Browser 
        ./gui/kitty       # Terminal emulator
        ./gui/pylauncher  # Simple Launcher(active environment and start neovide.)
    ];

    home.packages = with pkgs; [
        discord     # Chat Tool
        neovide     # neovim animated
        paprefs     # controls audio output
        pavucontrol # controls audio output
        wineWowPackages.stable # wine
        grim        # Screen shot
        # steam       # Everyone knows It's useless on linux
        winetricks  # Wine helper
        musescore   # Midi file editor
        hmcl        # Minecraft launcher
        obs-studio  # Useful software
        notify-desktop # send notify
        veracrypt   # Encrypt software
        # virtualbox  # VM
    ] ++ [
        inputs.nix-gaming.packages.${pkgs.system}.osu-lazer-bin
        # inputs.nix-gaming.packages.${pkgs.system}.wine-tkg
    ];

    xdg = {
        enable = true;
    };
}
