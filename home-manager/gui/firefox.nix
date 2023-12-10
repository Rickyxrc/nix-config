{ pkgs, ... }:
let
  nur = import
    (
      builtins.fetchTarball {
        url = "https://github.com/nix-community/NUR/archive/b0a35357871c473c5cd1de2a0a66abdcef4f52c7.tar.gz";
        sha256 = "0xzi290ckwpa7vsrf74s23vmk1va8hibmyrpnjwwhz9wsxxg1ryl";
      })
    { nurpkgs = pkgs; pkgs = pkgs; };
in
{
  programs.firefox = {
    enable = true;
    profiles."ricky" = {
      extensions = with nur.repos.rycee.firefox-addons; [
        ublock-origin
        darkreader
        vimium
        bitwarden
      ];
    };
  };
}
