{ pkgs, lib, ...} :
{
  # programs.oh-my-zsh = {
    # enable = true;
  # };

  # programs.powerlevel10k.enable = true;

  programs.zsh = {
    enable = true;
    # shellAliases = {
      # update-config = "home-manager switch --flake ~/nixos-config#ricky@ricky-wsl-ubuntu";
      # edit-config   = "cd ~/nixos-config && nvim";
    # };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ] ;
    };
    zplug = {
      enable = true;
      plugins = [
        # { name = "zsh-users/zsh-autosuggestions"; } # Simple plugin installation
        { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; } # Installations with additional options. For the list of options, please refer to Zplug README.
	# { name = "git"; }
        # { name = "chisui/zsh-nix-shell"; }
	# {
	#  name = "powerlevel10k-config";
	#  src  = lib.cleanSource ./zsh-config;
	#  file = "p10k.zsh";
	#}
      ];
    };
    # initExtra = "neofetch";
  };
  home.file.".p10k.zsh".source = ./zsh-config/p10k.zsh;
  home.file.".zshrc".source    = ./zsh-config/zshrc; # FIXME : dirty but useful solution
}
