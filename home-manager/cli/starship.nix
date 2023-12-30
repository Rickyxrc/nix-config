{
    programs.starship = {
        enable = true;
        settings = {
            add_newline = true;
            format = ''
                $all
            '';
        };
    };
    home.file.".bashrc".source = ./starship-config/bashrc;
    home.file.".bash_profile".source = ./starship-config/bashrc;
}
