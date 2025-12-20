# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  pkgs,
  ...
}:
{
  imports = [
    # ../secrets/home.nix

    ./cli/lazyvim
    ./cli/git
    ./cli/tmux
    ./cli/starship
    ./cli/bash
    # ./cli/cf-tool
    # ./cli/atcodercli
    ./cli/zsh
    ./cli/direnv
    # ./cli/calcurse
    # ./cli/pass
  ];

  home = {
    username = "ricky";
    homeDirectory = /Users/ricky;
  };

  home.packages = with pkgs; [
    tree # show filetree in system
    neofetch # show colorful system status in terminal
    nodejs # required by vimPlugins.coc-nvim
    gcc # idk why install it globally.
    # v2raya # Everyone knows why chinese developers need it.
    lazygit # Terminal UI for git.
    go-musicfox # Netease music player in terminal.
    # playerctl # Command line tool for media.
    htop # Process monitor in TUI
    unzip # I dont have this until I add this line lol
    wget # LOL too
    asciinema # Terminal Recorder
    crowdin-cli # Crowdin cli
    yazi # File Manager
    # pamixer # control volume
    gh # Github cli
    rclone # Sync data across cloud drives
    # gnupg # GPG 2
    # pinentry # Required by GPG2
    killall # LMAOOOO
    zip # I have unzip and don't have zip LMAO
    yadm # Yet another dotfile manager
    cowsay # Just for fun
  ];
  # Enable home-manager
  # programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  # systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
