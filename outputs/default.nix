{
  self,
  nixpkgs,
  home-manager,
  hyprland,
  homeage,
  nix-darwin,
  ...
}@inputs:
let
  inherit (self) outputs;
  lib = nixpkgs.lib;
  forAllSystems = lib.genAttrs lib.systems.flakeExposed;
  system = "aarch64-darwin";
  pkgs = nixpkgs.legacyPackages."${system}";
in
{
  # homeConfigurations = {
  # "ricky@ricky-mac" = home-manager.lib.homeManagerConfiguration {
  # inherit pkgs;
  # extraSpecialArgs = { inherit inputs outputs; };
  # modules = [
  # # home-manager.nixosModules.home-manager
  # # homeage.homeManagerModules.homeage
  # # ../home-manager/home.nix
  # ../home-manager/home-minimal-for-test.nix
  # ];
  # };
  # };

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
            # # inherit pkgs;
            # # extraSpecialArgs = {inherit inputs outputs;};
            users.ricky = ../home-manager/home-minimal-for-test.nix;
            # users.ricky = {
            # home = {
            # username = "ricky";
            # homeDirectory = "/Users/ricky";
            # };
            # home.stateVersion = "23.05";
            # };
          };
        }

        # home.stateVersion = "23.05";
        # };
        # extraSpecialArgs = { inherit pkgs inputs outputs; };
        # };
        # #
        # # Optionally, use home-manager.extraSpecialArgs to pass
        # # arguments to home.nix
        # };
      ];
    };
  };
}
