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
    initContent = ''
      # set env vars
      export EDITOR=nvim
      export GPG_TTY=$(tty)
      # gpg-connect-agent updatestartuptty /bye >/dev/null

      alias j="just"
      alias cf="cf-tool"
      alias y="yadm"

      # neofetch
      # NOO, it takes too long time

      # Other package generated hook
    '';
  };
}
