{
  pkgs,
  # nur-ryan4yin,
  ...
}: {
  home.file.".local/share/fcitx5/themes" = {
    source = ./themes;
    recursive = true;
  };

  home.file.".config/fcitx5/conf/classicui.conf".source = ./classicui.conf;

  # Chinese input method
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs;[
      fcitx5-rime
      fcitx5-configtool
      fcitx5-chinese-addons
      fcitx5-gtk
    ];
  };
}
