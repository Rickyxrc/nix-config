{ pkgs, ... }: 
{
    programs.neovim.enable = true;
    home.file.".config/nvim" = {
        source = ./conf;
        recursive = true;
    };
    home.packages = with pkgs; [
        cargo       # required by some lsp servers
        ripgrep     # Advanced command for 'grep', required by vimPlugins.Telescope-nvim.
        fd          # Advanced command for 'find', required by vimPlugins.Telescope-nvim.
    ];
}
