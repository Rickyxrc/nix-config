{
  nixpkgs,
  home-manager,
  hyprland,
  homeage,
  ...
}@inputs:
let
  system = "x86_64-linux";
  pkgs = nixpkgs.legacyPackages."${system}";
in
{
  # NixOS configuration entrypoint
  # Available through 'nixos-rebuild --flake .#your-hostname'
  nixosConfigurations = {
    "ricky-nixos-mi-laptop" = nixpkgs.lib.nixosSystem {
      specialArgs = inputs;
      modules = [
        ../../nixos/ricky-nixos-mi-laptop/configuration.nix
        ../../secrets
      ];
    };
  };

  # Standalone home-manager configuration entrypoint
  # Available through 'home-manager --flake .#your-username@your-hostname'
  homeConfigurations = {
    "ricky@ricky-nixos-mi-laptop" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpacialArgs = inputs;
      modules = [
        hyprland.homeManagerModules.default
        homeage.homeManagerModules.homeage
        ../../home-manager/home-kde.nix
      ];
    };
  };
}
