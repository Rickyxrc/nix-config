{ ... } :
{
    programs.tmux = {
      enable = true;
      extraConfig = builtins.readFile ./oh-my-tmux/tmux.conf;
    };
    home.file.".config/tmux/tmux.conf.local".source = ./oh-my-tmux/tmux.conf.local;
}
