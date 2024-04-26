# NOTE: From https://github.com/ryan4yin/nix-config/blob/fd4f1f90863ee9c9b216f1d770b0af5d98e67389/overlays/fcitx5/default.nix
# 为了不使用默认的 rime-data，改用我自定义的小鹤音形数据，这里需要 override
# 参考 https://github.com/NixOS/nixpkgs/blob/e4246ae1e7f78b7087dce9c9da10d28d3725025f/pkgs/tools/inputmethods/fcitx5/fcitx5-rime.nix
(_: super: {
  # 小鹤音形配置，配置来自 flypy.com 官方网盘的鼠须管配置压缩包「小鹤音形“鼠须管”for macOS.zip」
  # 我仅修改了 default.yaml 文件，将其中的半角括号改为了直角括号「 与 」。
  # rime-data = ./rime-data-flypy;
  rime-data = ./rime-data-huma;
  # fcitx5-rime = super.fcitx5-rime.override { rimeDataPkgs = [ ./rime-data-flypy ]; };
  fcitx5-rime = super.fcitx5-rime.override { rimeDataPkgs = [ ./rime-data-huma ]; };

  # used by macOS Squirrel
  # flypy-squirrel = ./rime-data-huma;
})
