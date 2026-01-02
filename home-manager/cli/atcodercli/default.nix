{
  pkgs,
  atcodercli,
  ...
}:
{
  home.packages = [ atcodercli.packages.${pkgs.system}.default ];
}
