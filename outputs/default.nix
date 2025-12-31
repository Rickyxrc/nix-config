{
  self,
  nixpkgs,
  home-manager,
  nix-darwin,
  ...
}@inputs:
let
  lib = nixpkgs.lib;
  frAllSystems = lib.genAttrs lib.systems.flakeExposed;
  system = "aarch64-darwin";
  pkgs = nixpkgs.legacyPackages."${system}";
in
{
  darwinConfigurations = {
    "ricky-mac" = nix-darwin.lib.darwinSystem {
      inherit system;
      modules = [
        ../nixos/ricky-mac/configuration.nix
        home-manager.darwinModules.home-manager
        {
          users.users.ricky = {
            name = "ricky";
            home = /Users/ricky;
          };

          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.ricky = ../home-manager/home-minimal-for-test.nix;
            extraSpecialArgs = { inherit inputs; };
          };
        }
      ];
    };
  };

  devShells."${system}".default = pkgs.mkShell {
    packages = with pkgs; [
      pre-commit
      just
    ];
  };
}
