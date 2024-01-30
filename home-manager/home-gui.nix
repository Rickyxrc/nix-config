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
        steam       # Everyone knows
        musescore   # Midi file editor
    ] ++ [
        inputs.nix-gaming.packages.${pkgs.system}.osu-lazer-bin
        # inputs.nix-gaming.packages.${pkgs.system}.wine-tkg
    ];

    xdg = {
        enable = true;
    };
}
