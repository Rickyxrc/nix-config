{
  home-manager,
  nix-darwin,
  ...
}@inputs:
let
  system = "aarch64-darwin";
in
{
  darwinConfigurations = {
    "ricky-mac" = nix-darwin.lib.darwinSystem {
      inherit system;
      modules = [
        ../../nixos/ricky-mac/configuration.nix
        home-manager.darwinModules.home-manager
        {
          users.users.ricky = {
            name = "ricky";
            home = /Users/ricky;
          };

          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.ricky = ../../home-manager/home-minimal-for-test.nix;
            extraSpecialArgs = inputs;
          };
        }
      ];
    };
  };

}
