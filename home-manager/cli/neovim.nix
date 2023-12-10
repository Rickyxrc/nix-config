{ pkgs, ... } :
{
  programs.neovim = {
    enable = true;
    # defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    plugins = [
      { plugin = pkgs.vimPlugins.nerdtree; }
      { plugin = pkgs.vimPlugins.gitsigns-nvim; }
      { plugin = pkgs.vimPlugins.toggleterm-nvim; }
      { plugin = pkgs.vimPlugins.telescope-nvim; }
      { plugin = pkgs.vimPlugins.vim-airline; }
      { plugin = pkgs.vimPlugins.vim-airline-themes; }
      { plugin = pkgs.vimPlugins.nvim-treesitter; }
      { plugin = pkgs.vimPlugins.everforest; }

      { plugin = pkgs.vimPlugins.coc-nvim; }
      { plugin = pkgs.vimPlugins.coc-pyright; }
      { plugin = pkgs.vimPlugins.coc-lua; }
      { plugin = pkgs.vimPlugins.coc-json; }
      { plugin = pkgs.vimPlugins.coc-yaml; }
      # { plugin = pkgs.vimPlugins.coc-astro; }
      { plugin = pkgs.vimPlugins.coc-markdownlint; }
      { plugin = pkgs.vimPlugins.coc-html; }
      { plugin = pkgs.vimPlugins.coc-tsserver; }

      # let github_nvim_theme_repo = pkgs.fetchFromGitHub {
      #  owner  = "projekt0n";
      #  repo   = "github-nvim-theme";
      #  # rev    = "88150c7b8a0664a70757ffd88b2ac12b84dd0604";
      #  # sha256 = "1mb3gfg01mj7ajjl1ylw24mnwamcnnifbxkakzal2j6ibqyqw6rq";
      #  sha256 = "22aa0678517d8f7e5fc84e89162c553e9b281e5b"
      #}; in import "${github_nvim_theme_repo}/release.nix"
    ];
  };
  home.file.".config/nvim/init.vim".source = ./neovim-config/init.vim;
}
