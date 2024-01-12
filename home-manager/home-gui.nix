{lib, pkgs, ...} : {
    imports = [
         ./home.nix        # Basic environments
        ./gui/firefox     # Browser 
        ./gui/kitty       # Terminal emulator
    ];

    home.packages = with pkgs; [
        discord # Chat Tool
        neovide # neovim animated
    ];
}
