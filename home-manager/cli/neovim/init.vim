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
" autocmd VimEnter * NERDTree
" Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Treesitter highlight
lua require('nvim-treesitter.configs').setup {}

" Gitsigns
" lua require("modules.gitsigns")
lua require("gitsigns").setup()

" Telescope
lua << EOF
local actions = require "telescope.actions"
require "telescope".setup{
    defaults = {
        mappings = {
            n = {
                [ "hb" ] = actions.close
            }
        }
    }
}
EOF

noremap <Leader>fd :Telescope find_files<CR>
noremap <Leader>df :Telescope find_files<CR>
noremap <Leader>fg :Telescope live_grep<CR>
noremap <Leader>gf :Telescope live_grep<CR>

" Toggleterm
lua require("toggleterm").setup()

" No need to press shift for enter command any more!
noremap ; :
inoremap hb <Esc>
cnoremap hb <Esc>

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

" Open and close NERDTree
noremap <Leader>nb :NERDTree<CR>
noremap <Leader>nx :NERDTreeClose<CR>

" Open Terminal
noremap <Leader>dt :ToggleTerm<CR> " Below

" Trying lua syntax, dirty sol
" Where is terminal mapping <leader> ?
lua << EOF
vim.api.nvim_set_keymap("n", "<leader>rt", '<cmd>ToggleTerm direction="float"<CR>i<Backspace>', {noremap = true, silent = true})
vim.api.nvim_set_keymap("t", "hb", '<C-\\><C-n><cmd>ToggleTerm direction="float"<CR>', {noremap = true, silent = true})
EOF

if exists("g:neovide")
    " Neovide config goes here.
    let g:neovide_scale_factor = 0.75
    " g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
    let g:neovide_transparency = 0.9
    let g:transparency = 0.8
    let g:neovide_background_color = '#0f1117'.printf('%x', float2nr(255 * g:transparency))
end

