{
  programs.zsh = {
    enable = true;
    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; }
      ];
    };
    initExtra = ''
      # set env vars
      export EDITOR=vim
      export GPG_TTY=$(tty)
      gpg-connect-agent updatestartuptty /bye >/dev/null

      alias j="just"
      alias cf="cf-tool"
      alias y="yadm"

      # Other package generated hook
    '';
  };
}
