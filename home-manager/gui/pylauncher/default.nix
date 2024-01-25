{ inputs, pkgs, ... } : {
    home.packages = [ inputs.pylauncher.packages.${pkgs.system}.default ];
    # home.file."pylauncher.desktop".source = ./pylauncher.desktop;
}
