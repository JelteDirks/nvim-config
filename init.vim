language en_US
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set exrc
set relativenumber
set nu
set nohlsearch
set hidden
set noerrorbells
set nowrap
set incsearch
set scrolloff=10
set signcolumn=auto
set colorcolumn=80
set termguicolors

let mapleader = " "

call plug#begin("~/.config/nvim/plugged")
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'ellisonleao/gruvbox.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lualine/lualine.nvim'
call plug#end()

set background=dark
colorscheme gruvbox

lua require("treesitter")
lua require("devicons")
lua require("statusline")

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

