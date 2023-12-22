{ pkgs, lib, ... } :
{
    programs.kitty = {
        enable = true;
        extraConfig = lib.fileContents ./kitty-config/kitty.conf;
    };
}

