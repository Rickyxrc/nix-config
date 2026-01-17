{
  secrets,
  config,
  homeage,
  ...
}:
{
  imports = [ homeage.homeManagerModules.homeage ];
  homeage = {
    identityPaths = [ "~/.ssh/id_ed25519" ];
    installationType = "systemd";
    # sample config
    # file."calcurse-webdav.age" = {
    # source = "${inputs.secrets}/calcurse-webdav.age";
    # symlinks = [ "${config.xdg.configHome}/test" ];
    # };
    file."rclone.age" = {
      source = "${secrets}/rclone.age";
      symlinks = [ "${config.xdg.configHome}/rclone/rclone.conf" ];
    };
  };
}
