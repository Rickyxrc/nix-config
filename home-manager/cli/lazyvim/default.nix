{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };
  home.file.".config/nvim" = {
    source = ./conf;
    recursive = true;
  };
  home.packages = with pkgs; [
    cargo # required by some lsp servers
    ripgrep # Advanced command for 'grep', required by vimPlugins.Telescope-nvim.
    fd # Advanced command for 'find', required by vimPlugins.Telescope-nvim.
    tree-sitter # required by treesitter
    ast-grep # Useful lsp
    rust-analyzer # rust lsp
    lua-language-server # lol.
  ];
}
