# NOTE: ref https://github.com/ryan4yin/nix-config/blob/b047c064d64ac5858128e944e77cc59de407a7a5/home/base/desktop/password-store/default.nix
{ pkgs, config, lib, ... }: {
  programs.password-store = {
    enable = true;
    package = pkgs.pass.withExtensions (exts: [
      exts.pass-import # a generic importer tool from other password managers
      exts.pass-update # an easy flow for updating passwords
    ]);
    settings = {
      # PASSWORD_STORE_DIR = "${config.xdg.dataHome}/password-store";

      PASSWORD_STORE_KEY = lib.strings.concatStringsSep " " [
        "1848FF441D9359F5"
      ];
      PASSWORD_STORE_SIGNING_KEY = lib.strings.concatStringsSep " " [
        "EC3A13D0EF2D264E"
      ];

      PASSWORD_STORE_CLIP_TIME = "60";
      PASSWORD_STORE_GENERATED_LENGTH = "15";
      PASSWORD_STORE_ENABLE_EXTENSIONS = "true";
    };
  };

  programs.browserpass = {
    enable = true;
    browsers = [
      # "chrome"
      # "chromium"
      "firefox"
    ];
  };
}
