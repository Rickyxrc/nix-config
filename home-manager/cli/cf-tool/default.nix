{inputs, config, options, modulesPath, outputs, lib, specialArgs, pkgs} : {
    home.packages = [ inputs.cf-tool.packages.${pkgs.system}.default ]; # flake cf-tool packaged by rickyxrc
    home.file.".cf/config".source = ./config;
    home.file."oi/template.cpp".source = ./template.cpp;
    home.file."oi/debugger.h".source = ./debugger.h;
}
