# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
    imports = [
        ./cli/neovim
        ./cli/git
        ./cli/tmux
        ./cli/starship
        ./cli/bash
        ./cli/cf-tool
        ./cli/atcodercli
    ];

    nixpkgs = {
        overlays = [
            # Load NUR overlay here to use it with pkgs.nur
            inputs.nur.overlay
        ];

        config = {
            allowUnfree = true;
            # Workaround for https://github.com/nix-community/home-manager/issues/2942
            allowUnfreePredicate = _: true;
        };
    };

    home = {
        username = "ricky";
        homeDirectory = "/home/ricky";
    };

    home.packages = with pkgs; [
        tree        # show filetree in system
        neofetch    # show colorful system status in terminal
        nodejs      # required by vimPlugins.coc-nvim
        gcc         # idk why install it globally.
        v2raya      # Everyone knows why chinese developers need it.
        ripgrep     # Advanced command for 'grep', required by vimPlugins.Telescope-nvim.
        fd          # Advanced command for 'find', required by vimPlugins.Telescope-nvim.
        lazygit     # Terminal UI for git.
        go-musicfox # Netease music player in terminal.
        playerctl   # Command line tool for media.
        htop        # Process monitor in TUI
    ];

    # Enable home-manager
    programs.home-manager.enable = true;

    # Nicely reload system units when changing configs
    systemd.user.startServices = "sd-switch";

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    home.stateVersion = "23.05";
}
