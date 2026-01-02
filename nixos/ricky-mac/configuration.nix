{ pkgs, ... }:

{
  nix.settings.experimental-features = "nix-command flakes";

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = [ ];

  networking.hostName = "ricky-mac"; # Define your hostname.

  time.timeZone = "Asia/Shanghai";

  # Select internationalisation properties.
  # i18n.defaultLocale = "zh_CN.UTF-8"; # it was "en_US.utf-8" a long time lol

  users.users.ricky.shell = pkgs.zsh;

  # Enable alternative shell support in nix-darwin.
  # programs.fish.enable = true;

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-color-emoji

    # udev-gothic-nf

    source-han-sans
    source-han-serif

    fira-code
    fira-code-symbols

    # nerdfonts
  ];

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;
}
