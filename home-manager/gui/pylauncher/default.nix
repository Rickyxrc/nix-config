{ pylauncher, pkgs, ... }:
{
  home.packages = [ pylauncher.packages.${pkgs.system}.default ];
  # home.file."pylauncher.desktop".source = ./pylauncher.desktop;
}
