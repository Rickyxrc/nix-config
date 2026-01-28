{
  home-manager,
  nix-darwin,
  nixpkgs,
  ...
}@inputs:
{
  darwinConfigurations = {
    "ricky-mac" = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
        ../../nixos/ricky-mac/configuration.nix
        {
          nixpkgs = {
            config = {
              allowUnfree = true;
            };
          };
        }
        home-manager.darwinModules.home-manager
        {
          users.users.ricky = {
            name = "ricky";
            home = /Users/ricky;
          };

          home-manager = {
            useGlobalPkgs = true;

            useUserPackages = true;
            users.ricky = ../../home-manager/home-mac.nix;
            extraSpecialArgs = inputs;
          };
        }
      ];
    };
  };

}
