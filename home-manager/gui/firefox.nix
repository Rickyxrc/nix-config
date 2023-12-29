{ pkgs, ... }:
{
    programs.firefox = {
        enable = true;
        profiles."ricky" = {
            extensions = with pkgs.nur.repos.rycee.firefox-addons; [
                ublock-origin
                darkreader
                vimium
                bitwarden
            ];
        };
    };
}
