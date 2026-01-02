# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  pkgs,
  nix-darwin,
  ...
}:
{
  imports = [
    # ../secrets/home.nix

    # ./cli/lazyvim
    ./cli/git
    ./cli/tmux
    ./cli/starship
    ./cli/bash
    # ./cli/cf-tool
    # ./cli/atcodercli
    ./cli/zsh
    ./cli/direnv
    # ./cli/calcurse
    ./cli/pass
    # ./cli/lazyvim/lazyvimv2.nix
    # ./cli/lazyvim-flake
    ./cli/lazyvim-flake

    ./gui/kitty
  ];

  # nixpkgs = {
  # config = {
  #allowUnfree = true;
  # Workaround for https://github.com/nix-community/home-manager/issues/2942
  # allowUnfreePredicate = _: true;
  # };
  # };

  home = {
    username = "ricky";
    homeDirectory = /Users/ricky;
  };

  home.packages = with pkgs; [
    nix-darwin # nix-darwin to manage the env

    hmcl
    git # git
    tree # show filetree in system
    neofetch # show colorful system status in terminal
    # nodejs # required by vimPlugins.coc-nvim
    # gcc # idk why install it globally.
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
    # rustfmt # Rust code formatter
    qbittorrent-enhanced # A nice torrent client with GUI
    # veracrypt

    # TODO: make a choice
    dooit # Todo application in cli
    # calcure # Calendar and todo list

    tldr # Too long dont read | Document for commands
    duf # Disk space monitor
    fzf # Fuzzy file match
    zoxide # Advanced cd
    ast-grep # ast rewrite

    gemini-cli # Gemini code assistant

    nix-output-monitor # Pretty output
    texliveFull
  ];

  # Enable home-manager
  # programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  # systemd.user.startServices = "sd-switch";
  # programs.lazyvim.enable = true;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
