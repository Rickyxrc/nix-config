# NOTE: https://github.com/ryan4yin/nix-config/tree/main/secrets

{ inputs, ... }: {
  imports = [
    inputs.agenix.nixosModules.default
  ];

  age.identityPaths = [
    "/etc/ssh/ssh_host_ed25519_key"
  ];

  # sample config
  # age.secrets."calcurse-webdav.age" = {
  # symlink = true;
  # path = "/home/ricky/.config/calcurse/caldav/config";
  # file = "${inputs.secrets}/calcurse-webdav.age";
  # mode = "0444"; # read only
  # owner = "root";
  # group = "root";
  # };
}
