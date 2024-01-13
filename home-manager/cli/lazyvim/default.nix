{
    programs.neovim.enable = true;
    home.file.".config/nvim" = {
        source = ./conf;
        recursive = true;
    };
}
