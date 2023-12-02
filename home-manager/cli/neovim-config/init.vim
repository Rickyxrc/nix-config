" Ext pack load
" lua luavim.opt['runtimepath']:prepend(vim.loop.os_homedir() .. ".config/nvim/")

set number
syntax on

" Disable mouse
set mouse = 

" Set tab sace
set ts=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent

" Plugins
" call plug#begin("~/.config/nvim/plugged")
"    Plug 'projekt0n/github-nvim-theme'
"    Plug 'vim-airline/vim-airline'
"    Plug 'vim-airline/vim-airline-themes'
"    Plug 'preservim/nerdtree'
"    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"    Plug 'neoclide/coc.nvim', {'branch': 'release'}
"    Plug 'lewis6991/gitsigns.nvim'
"    Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
"    Plug 'nvim-lua/plenary.nvim'
"    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.4' }
"call plug#end()

" Theme
set termguicolors
colorscheme github_dark_dimmed
hi Normal guibg=NONE ctermbg=NONE

" NERDTree Conf
" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Treesitter highlight
" lua require("modules.treesitter")
lua require'nvim-treesitter.configs'.setup {}

" Gitsigns
" lua require("modules.gitsigns")
lua require("gitsigns").setup()

" ToggleTerm
lua require("toggleterm").setup()

noremap <F5> :ToggleTerm size=12 direction=horizontal name=desktop<CR>
tmap <Esc> <C-\><C-n>

" Telescope
lua require('telescope').setup()
noremap <F8> :Telescope find_files<CR>
