{ pkgs, lib, ... }:
let
  debug_zsh_startup = false;
in
{
  programs.zsh = {
    enable = true;

    # NOTE: I will manual added completion code(below)
    enableCompletion = false;

    # NOTE: Alternative as below: 'zinit'
    zplug.enable = false;
    zplug.plugins = [
      { name = "zsh-users/zsh-autosuggestions"; }
      { name = "zsh-users/zsh-syntax-highlighting"; }
    ];

    shellAliases = with pkgs; {
      j = lib.getExe just;
      # cf = "cf-tool";
      y = lib.getExe yazi;
      music = "~/.shell-scripts/background-music.sh&";
      ta = "tmux attach -t \"\${$(tmux ls | fzf)%%:*}\"";
    };
    history.size = 1000;

    initContent = lib.mkMerge [
      (if debug_zsh_startup then (lib.mkBefore "zmodload zsh/zprof") else lib.mkDefault "")

      # install zinit
      (lib.mkOrder 569 ''
        ZINIT_HOME="''${XDG_DATA_HOME:-''${HOME}/.local/share}/zinit/zinit.git"
        [ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
        [ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
        source "''${ZINIT_HOME}/zinit.zsh"

        zi for \
          atload"zicompinit; zicdreplay" \
          blockf \
          lucid \
          wait \
          zsh-users/zsh-completions

        # zinit load "zsh-users/zsh-autosuggestions"
        # zinit load "zsh-users/zsh-syntax-highlighting"

        # wait"0" - 启动后立即异步加载（后台加载）
        zinit ice wait"0" lucid
        zinit light zsh-users/zsh-autosuggestions

        # wait"0" - 首次显示提示符后加载
        zinit ice wait"0" lucid
        zinit light zsh-users/zsh-syntax-highlighting
      '')
      # # (lib.mkOrder 570 ''
      # 启用缓存
      # autoload -Uz compinit
      # if [[ -n ''${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
      # compinit
      # else
      # # 跳过检查，直接使用缓存
      # compinit -C
      # fi
      # '')
      (lib.mkOrder 521 ''
        DISABLE_AUTO_UPDATE="true"
        DISABLE_MAGIC_FUNCTIONS="true"
        DISABLE_COMPFIX="true"

        # set env vars
        export EDITOR=nvim
        # export GPG_TTY=$(tty)
        # gpg-connect-agent updatestartuptty /bye >/dev/null

        eval "$(zoxide init zsh --cmd cd)" # init zoxide

        # neofetch
        ${lib.getExe pkgs.fastfetch}
        # NOO, it takes too long time

        # Other package generated hook
      '')

      (if debug_zsh_startup then (lib.mkAfter "zprof") else lib.mkDefault "")
    ];

    # initContent = lib.mkAfter "";
  };

  home.file.".shell-scripts/background-music.sh".source = ./scripts/background-music.sh;
}
