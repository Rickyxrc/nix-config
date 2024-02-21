{ pkgs, ... }: {
  home.packages = with pkgs; [ calcurse ];
  # config in secret
}
