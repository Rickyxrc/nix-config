{
  description = "Ricky's nix config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = github:nixos/nixpkgs/nixos-23.11;

    # Home manager
    home-manager = {
        url = github:nix-community/home-manager/release-23.11;
        inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hyprland config
    hyprland = {
      url = github:hyprwm/Hyprland;
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur.url = github:nix-community/NUR;

    cf-tool.url = github:rickyxrc/cf-tool;
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    hyprland,
    nur,
    cf-tool,
    ...
  } @ inputs: let
    inherit (self) outputs;
  in {
    # NixOS configuration entrypoint
    # Available through 'nixos-rebuild --flake .#your-hostname'
    nixosConfigurations = {
      "ricky-nixos-mi-laptop" = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          ./nixos/ricky-nixos-mi-laptop/configuration.nix
        ];
      };
      "ricky-nixos-xjcw-virtual-machine" = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
            # Will be updated when I got 'configuration.nix'
        ];
      };
    };

    # Standalone home-manager configuration entrypoint
    # Available through 'home-manager --flake .#your-username@your-hostname'
    homeConfigurations = {
      "ricky@ricky-nixos-mi-laptop" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [
          ./home-manager/home-gui.nix
          hyprland.homeManagerModules.default
        ];
      };
      "ricky@ricky-nixos-xjcw-virtual-machine" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [
          ./home-manager/home.nix
        ];
      };
    };
  };
}
