# An alternative for ls
{ pkgs, lib, ... }:
let
  inherit (pkgs) eza;
in
{
  home.packages = [ eza ];
  programs.zsh.shellAliases = {
    ls = lib.getExe eza;
  };
}
