{
  description = "Ricky's nix config";

  inputs = {
    # Nixpkgs
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-23.11";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland/v0.33.1";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur.url = "github:nix-community/NUR";

    cf-tool = {
      url = "github:rickyxrc/cf-tool";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    atcodercli = {
      url = "github:rickyxrc/at-cli/tags/v0.5.5";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-gaming = {
      url = "github:fufexan/nix-gaming";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    pylauncher = {
      url = "github:rickyxrc/pylauncher";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };

    secrets.url = "git+ssh://git@github.com/rickyxrc/nix-secrets";
  };

  outputs =
    { self
    , nixpkgs
    , home-manager
    , hyprland
    , nur
    , cf-tool
    , agenix
    , secrets
    , ...
    } @ inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages."${system}";
      inherit (self) outputs;
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
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [
            hyprland.homeManagerModules.default
            ./home-manager/home-hyprland.nix
          ];
        };
        "ricky@ricky-ubuntu-xjcw-virtual-machine" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [
            ./home-manager/home-gui.nix
          ];
        };
      };

      devShells."${system}".default = pkgs.mkShell {
        packages = with pkgs; [ pre-commit nixpkgs-fmt ];
      };
    };
}
