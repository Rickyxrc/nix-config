{
  # load starship config auto
  home.file.".bashrc".source = ./bashrc;
  # let login shell load this config
  home.file.".bash_profile".source = ./bashrc;
}
