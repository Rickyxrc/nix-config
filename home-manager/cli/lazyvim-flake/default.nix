{ lazyvim, pkgs, ... }:
{
  imports = [ lazyvim.homeManagerModules.default ];

  programs.lazyvim = {
    enable = true;
    extras = {
      lang = {
        nix.enable = true;
        rust.enable = true;
        json.enable = true;
      };
      coding = {
        luasnip.enable = true;
      };
    };

    ignoreBuildNotifications = true;

    extraPackages = with pkgs; [
      tree-sitter

      # json
      vscode-json-languageserver

      # lua language
      lua5_1 # lua support
      luarocks # package manager of lua language
      lua-language-server # lua language server

      # nix language
      nil # nix language server
      statix # nix lint and suggestion
      nixfmt # nix formatter

      shfmt
      stylua
      ast-grep

      imagemagick # image converter
    ];

    config = {
      autocmds = ''
        vim.api.nvim_create_autocmd("FocusLost", {
          command = "silent! wa",
          desc = "Auto-save on focus loss",
        })
      '';
    };

    plugins = {
      git-blame = builtins.readFile ./conf/lua/plugins/git-blame.lua;
      # tabout = builtins.readFile ./conf/lua/plugins/tabout.lua;
      dashboard = builtins.readFile ./conf/lua/plugins/tabout.lua;
      # Luasnip = builtins.readFile ./conf/lua/plugins/Luasnip.lua;

      tokyonight = builtins.readFile ./conf/lua/plugins/tokyonight.lua;
      # The theme itself supported transparent.
      # transparent = builtins.readFile ./conf/lua/plugins/transparent.lua;
    };
  };

  # Code snippets (VSCode style)
  home.file.".config/nvim/snippets" = {
    source = ./snippets;
    recursive = true;
  };
}
