# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, pkgs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      # /etc/nixos/hardware-configuration.nix
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "ricky-nixos-mi-laptop"; # Define your hostname.
  networking.proxy.allProxy = "127.0.0.1:20171";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Shanghai";

  # Select internationalisation properties.
  i18n.defaultLocale = "zh_CN.UTF-8"; # it was "en_US.utf-8" a long time lol

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "zh_CN.UTF-8";
    LC_IDENTIFICATION = "zh_CN.UTF-8";
    LC_MEASUREMENT = "zh_CN.UTF-8";
    LC_MONETARY = "zh_CN.UTF-8";
    LC_NAME = "zh_CN.UTF-8";
    LC_NUMERIC = "zh_CN.UTF-8";
    LC_PAPER = "zh_CN.UTF-8";
    LC_TELEPHONE = "zh_CN.UTF-8";
    LC_TIME = "zh_CN.UTF-8";
  };


  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };
  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  # KDE Plasma 6 is now available on unstable

  # services.desktopManager.plasma6.enable = true;
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ricky = {
    isNormalUser = true;
    description = "ricky";
    extraGroups = [ "networkmanager" "wheel" "input" "audio" ];
    packages = [ ];
  };
  users.users.ricky.shell = pkgs.zsh;
  users.users.ricky.ignoreShellProgramCheck = true;

  # Enable automatic login for the user.
  # services.getty.autologinUser = "ricky";

  # Generate host ssh key
  services.openssh = {
    enable = true;
    hostKeys = [
      {
        bits = 4096;
        openSSHFormat = true;
        path = "/etc/ssh/ssh_host_ed25519_key";
        rounds = 100;
        type = "ed25519";
      }
    ];
  };

  services.v2raya = {
    enable = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = "nix-command flakes";
  nix.settings.trusted-users = [ "ricky" ];

  environment.sessionVariables = {
    INPUT_METHOD = "fcitx5";
    GTK_IM_MODULE = "fcitx5";
    QT_IM_MODULE = "fcitx5";
    XMODIFIERS = "fcitx5";
  };
  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [
    # vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    pulseaudio
    sof-firmware
    inputs.agenix.packages.x86_64-linux.default
  ];

  programs.gnupg.agent = {
    enable = true;
    pinentryFlavor = "curses";
  };

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-emoji

    # udev-gothic-nf

    source-han-sans
    source-han-serif

    fira-code
    fira-code-symbols

    nerdfonts
  ];

  nixpkgs.config.pulseaudio = true;
  sound.enable = true;
  hardware = {
    enableAllFirmware = true;
    pulseaudio = {
      enable = true;
      support32Bit = true;
      package = pkgs.pulseaudioFull;
      extraConfig = "load-module module-switch-on-port-available";
    };
    bluetooth = {
      enable = true;
    };
    opengl = {
      driSupport32Bit = true;
      enable = true;
    };
  };

  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "ricky" ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
