{ ... }:
{
  programs.git = {
    settings = {
      enable = true;
      user = {
        name = "Rickyxrc";
        email = "rickyxrc@outlook.com";
        signingkey = "007262DFAB2E86DE9B40D42C291041CCDCC43369";
      };
      commit = {
        gpgsign = true;
      };
    };
  };
}
