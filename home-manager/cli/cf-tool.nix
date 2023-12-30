{ pkgs, lib } :
pkgs.buildGoModule rec {
    pname = "cf-tool";
    version = "v1.0.0";
    src = pkgs.fetchFromGitHub {
        owner = "Rickyxrc";
        repo = "cf";
        rev = "${version}";
        hash = "sha256-o0jxzCb4qlgjciYwJvsswgbuj6YTE/gGtKudwJUuDig=";
    };
    vendorHash = null;
    meta = with lib; {
        description = "Codeforces Tool is a command-line interface tool for Codeforces.";
        homepage = "https://github.com/xalanq/cf-tool";
        # licence = licences.mit;
        # maintainers = with pkgs.maintainers; [ rickyxrc ];
        # platforms = platforms.all;
    };
}
