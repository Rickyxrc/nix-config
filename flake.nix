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

    homeage = {
      url = "github:jordanisaacs/homeage";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # NOTE: you can't deploy this flake bacause you can't access these repos.
    # These are my private repos, includes my password and secret files.
    secrets.url = "git+ssh://git@github.com/rickyxrc/nix-secrets";
    # NOTE: find a beter way to storage this
    # passwords = {
    # url = "git+ssh://git@github.com/rickyxrc/passwords";
    # flake = false;
    # };
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
    , homeage
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
          inherit pkgs;
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [
            hyprland.homeManagerModules.default
            homeage.homeManagerModules.homeage
            ./home-manager/home-kde.nix
          ];
        };
      };

      devShells."${system}".default = pkgs.mkShell {
        packages = with pkgs; [ pre-commit nixpkgs-fmt just ];
      };
    };
}
