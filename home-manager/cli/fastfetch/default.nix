# TODO: Make a System-specific config.
# Because every system differs from its args.
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    fastfetch
  ];
  home.file.".config/fastfetch/config.jsonc".source = ./config.jsonc;
}
