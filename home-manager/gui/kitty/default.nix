{ lib, ... } :
{
    programs.kitty = {
        enable = true;
        extraConfig = lib.fileContents ./kitty.conf;
    };

    home.file.".config/kitty/everforest.conf".source = ./everforest.conf;
    home.file.".config/kitty/tokyonight.conf".source = ./tokyonight.conf;
    home.file.".config/kitty/afterglow.conf".source = ./afterglow.conf;
}

