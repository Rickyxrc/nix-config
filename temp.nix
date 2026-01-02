
  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      hyprland,
      homeage,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      lib = nixpkgs.lib;
      forAllSystems = lib.genAttrs lib.systems.flakeExposed;
      system = "aarch64-darwin";
    in
    #forAllSystems (
    #system:
    let
      pkgs = nixpkgs.legacyPackages."${system}";
    in
    {
      # NixOS configuration entrypoint
      # Available through 'nixos-rebuild --flake .#your-hostname'
      nixosConfigurations = {
        "ricky-nixos-mi-laptop" = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./nixos/ricky-nixos-mi-laptop/configuration.nix
            ./secrets
          ];
        };
      };

      # Standalone home-manager configuration entrypoint
      # Available through 'home-manager --flake .#your-username@your-hostname'
      homeConfigurations = {
        "ricky@ricky-nixos-mi-laptop" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
        # extraSpecialArgs = { inherit inputs outputs; };
        # WARN: DON'T USE THIS!
          modules = [
            hyprland.homeManagerModules.default
            homeage.homeManagerModules.homeage
            ./home-manager/home-kde.nix
          ];
        };

        "ricky@ricky-mac" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
        # extraSpecialArgs = { inherit inputs outputs; };
        # WARN: DON'T USE THIS!
          modules = [
            homeage.homeManagerModules.homeage
            ./home-manager/home.nix
          ];
        };
      };

      devShells."${system}".default = pkgs.mkShell {
        packages = with pkgs; [
          cowsay
          # pre-commit
          # nixpkgs-fmt
          # just
          # neovim
          # fzf
        ];
      };
    };
  #);
}
