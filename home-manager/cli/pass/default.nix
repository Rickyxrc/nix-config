# NOTE: ref https://github.com/ryan4yin/nix-config/blob/b047c064d64ac5858128e944e77cc59de407a7a5/home/base/desktop/password-store/default.nix
{ pkgs, lib, ... }: {
  programs.password-store = {
    enable = true;
    package = pkgs.pass.withExtensions (exts: [
      exts.pass-import # a generic importer tool from other password managers
      exts.pass-update # an easy flow for updating passwords
    ]);
    settings = {
      PASSWORD_STORE_DIR = "/home/ricky/.password-store";

      PASSWORD_STORE_KEY = lib.strings.concatStringsSep " " [
        "01AF66273CC61FFA" # Ricky (Secret Encription only) <rickyxrc@outlook.com>
      ];
      PASSWORD_STORE_SIGNING_KEY = lib.strings.concatStringsSep " " [
        "EC3A13D0EF2D264E" # Ricky <rickyxrc@outlook.com>
      ];

      PASSWORD_STORE_CLIP_TIME = "60";
      PASSWORD_STORE_GENERATED_LENGTH = "25";
      PASSWORD_STORE_ENABLE_EXTENSIONS = "true";
    };
  };
}
