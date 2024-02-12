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
            # Launch Hyprland at tty1
            if [[ $TTY == /dev/tty1 ]]; then
                Hyprland;
            fi

            # set env vars
            export EDITOR=vim

            # Other package generated hook
        '';
    };
}
