{ ... }:
{
  programs.git = {
    enable = true;
    userName = "Rickyxrc";
    userEmail = "rickyxrc@outlook.com";
    extraConfig = {
      user = {
        signingkey = "007262DFAB2E86DE9B40D42C291041CCDCC43369";
      };
      commit = {
        gpgsign = true;
      };
    };
  };
}
