{ inputs, pkgs, outputs, lib, specialArgs, config, options, modulesPath }: {
  home.packages = [ inputs.atcodercli.packages.${pkgs.system}.default ]; # flake atcodercli packaged by rickyxrc
}
