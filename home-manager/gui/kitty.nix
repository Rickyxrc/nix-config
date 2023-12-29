{ pkgs, lib, ... } :
{
    programs.kitty = {
        enable = true;
        extraConfig = lib.fileContents ./kitty-config/kitty.conf;
    };

    home.file.".config/kitty/everforest.conf".source = ./kitty-config/everforest.conf;
}

