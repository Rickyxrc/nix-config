{ pkgs, lib, ...} :
{
    programs.tmux.enable = true;
    home.file.".tmux.conf".source = ./tmux-config/tmux.conf;
}
