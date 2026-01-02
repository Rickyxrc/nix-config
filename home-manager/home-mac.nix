{ nix-darwin, ... }:
{
  imports = [
    ./layers/develop-kit.nix
    ./layers/gaming.nix
  ];

  home = {
    username = "ricky";
    homeDirectory = /Users/ricky;
  };

  home.packages = [
    nix-darwin # nix-darwin to manage the env
  ];

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
