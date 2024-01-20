{pkgs, inputs, ...} : {
    imports = [
        ./home.nix        # Basic environments
        ./gui/firefox     # Browser 
        ./gui/kitty       # Terminal emulator
    ];

    home.packages = with pkgs; [
        discord     # Chat Tool
        neovide     # neovim animated
        paprefs     # controls audio output
        pavucontrol # controls audio output
        wineWowPackages.stable # wine
    ] ++ [
        inputs.nix-gaming.packages.${pkgs.system}.osu-lazer-bin
        # inputs.nix-gaming.packages.${pkgs.system}.wine-tkg
    ];
}
