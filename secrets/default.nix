# NOTE: https://github.com/ryan4yin/nix-config/tree/main/secrets

let
  permission = {
    read-only = "0444";
  };
in
{ inputs, ... }: {
  imports = [
    inputs.agenix.nixosModules.default
  ];

  age.identityPaths = [
    "/etc/ssh/ssh_host_ed25519_key"
  ];

  # Wait calcurse-webdav to be stable
  # age.secrets."calcurse-webdav.age" = {
  #    symlink = true;
  #    path = "/home/ricky/.config/calcurse/caldav/config";
  #    file = "${inputs.secrets}/calcurse-webdav.age";
  #    mode = permission.read-only;
  #    owner = "root";
  #    group = "root";
  # };
}
