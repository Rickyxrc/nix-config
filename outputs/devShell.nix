{ flake-utils, nixpkgs, ... }:
flake-utils.lib.eachDefaultSystem (
  system:
  let
    pkgs = nixpkgs.legacyPackages."${system}";
  in
  {
    devShells =
      let
        defaultPackages = with pkgs; [
          pre-commit
          just
        ];
      in
      {
        default = pkgs.mkShell {
          packages = defaultPackages;
        };
        # TODO: add a vim devShell here
      };
  }
)
