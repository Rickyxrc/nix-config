{ pkgs, ... }: {
  home.packages = with pkgs; [ calcurse ];

  # Config is in secret
  # TODO: Fix this firty solution
  # secrets/default.nix L16

  # home.file.".config/calcurse/caldav/config".source = /etc/secrets/calcurse-config;
}
