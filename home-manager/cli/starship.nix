{
    programs.starship = {
        enable = true;
        settings = {
            format = ''
                $directory#
            '';
        };
    };
    home.file.".bashrc".source = ./starship-config/bashrc;
}
