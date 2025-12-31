{
  description = "Ricky's nix config";

  inputs = {
    # Nixpkgs
    nixpkgs = {
      url = "github:nixos/nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
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
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
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
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lazyvim.url = "github:pfassina/lazyvim-nix";
  };
  outputs = inputs: import ./outputs inputs;
}
