{ pkgs, lib, ... } :
{
    programs.kitty = {
        enable = true;
        extraConfig = lib.fileContents ./kitty.conf;
    };

    home.file.".config/kitty/everforest.conf".source = ./everforest.conf;
}

