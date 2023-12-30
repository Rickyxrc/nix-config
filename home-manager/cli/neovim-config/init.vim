" Ext pack load
" lua luavim.opt['runtimepath']:prepend(vim.loop.os_homedir() .. ".config/nvim/")

set number
syntax on

" Disable mouse
set mouse = 

" Set leader key
let mapleader = " "

" Set tab sace
set ts=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent

" Theme
set termguicolors
colorscheme everforest

" NERDTree Conf
" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Treesitter highlight
lua require('nvim-treesitter.configs').setup {}

" Gitsigns
" lua require("modules.gitsigns")
lua require("gitsigns").setup()

" Telescope
lua require('telescope').setup()
noremap <Leader>fd :Telescope find_files<CR>
noremap <Leader>df :Telescope find_files<CR>
noremap <Leader>fg :Telescope live_grep<CR>
noremap <Leader>gf :Telescope live_grep<CR>

" Switch window
noremap <Leader>h <C-w>h
noremap <Leader>j <C-w>j
noremap <Leader>k <C-w>k
noremap <Leader>l <C-w>l

" Split window
noremap <Leader>- :sp<Enter>
noremap <Leader>\ :vsp<Enter>

" Paste
noremap <Leader>p :r!wl-paste<CR>

