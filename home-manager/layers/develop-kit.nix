# Only develop kits, doesn't include home conf
{
  pkgs,
  ...
}:
{
  imports = [
    ../cli/git
    ../cli/tmux
    ../cli/starship
    ../cli/bash
    ../cli/zsh
    ../cli/direnv
    ../cli/pass
    ../cli/lazyvim-flake
    ../gui/kitty
    ../cli/fastfetch
  ];

  home.packages = with pkgs; [
    # hmcl # Minecraft Launcher
    git # git
    tree # show filetree in system

    lazygit # Terminal UI for git.
    go-musicfox # Netease music player in terminal.
    htop # Process monitor in TUI
    unzip # I dont have this until I add this line lol
    wget # LOL too
    asciinema # Terminal Recorder
    crowdin-cli # Crowdin cli
    yazi # File Manager
    gh # Github cli
    rclone # Sync data across cloud drives
    killall # LMAOOOO
    zip # I have unzip and don't have zip LMAO
    yadm # Yet another dotfile manager
    cowsay # Just for fun
    # qbittorrent-enhanced # A nice torrent client with GUI

    dooit # Todo application in cli

    tldr # Too long dont read | Document for commands
    duf # Disk space monitor
    fzf # Fuzzy file match
    zoxide # Advanced cd
    ast-grep # ast rewrite

    gemini-cli # Gemini code assistant
    opencode # Open sourced code assistant

    nix-output-monitor # Pretty output
    # texliveFull
    nixpkgs-review # nixpkgs pullrequest reviewer

    gnupg # GPG
  ];
}
