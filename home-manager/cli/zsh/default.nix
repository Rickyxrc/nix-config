{
  programs.zsh = {
    enable = true;
    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; }
        { name = "zsh-users/zsh-syntax-highlighting"; }
      ];
    };
    shellAliases = {
      j = "just";
      cf = "cf-tool";
      y = "yazi";
      music = "~/.shell-scripts/background-music.sh&";
      ta = "tmux attach -t \"\${$(tmux ls | fzf)%%:*}\"";
    };
    history.size = 100000;
    initContent = ''
      # set env vars
      export EDITOR=nvim
      export GPG_TTY=$(tty)
      # gpg-connect-agent updatestartuptty /bye >/dev/null

      eval "$(zoxide init zsh --cmd cd)" # init zoxide

      # neofetch
      # NOO, it takes too long time

      # Other package generated hook
    '';
  };

  home.file.".shell-scripts/background-music.sh".source = ./scripts/background-music.sh;
}
