vim.api.nvim_exec([[language en_US]], false)

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.exrc = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.hidden = true
vim.opt.scrolloff = 10
vim.opt.signcolumn = 'auto'

vim.opt.colorcolumn = '80'
vim.opt.termguicolors = true
vim.opt.background = 'dark'

vim.opt.incsearch = true
vim.opt.hlsearch = false

vim.opt.errorbells = false
vim.opt.wrap = false

vim.g.mapleader = ' '

require('packer').startup(function()
    -- packer needs to manage itself
    use {'wbthomason/packer.nvim'}
    -- very useful shit, needed for telescope as well
    use {'nvim-lua/plenary.nvim'}
    -- I mean... ofc
    use {'nvim-telescope/telescope.nvim'}
    -- colors baby
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    -- cool colors baby
    use {'ellisonleao/gruvbox.nvim'}
    -- with cool icons baby
    use {'kyazdani42/nvim-web-devicons'}
    -- on that bottom b.... ar
    use {'nvim-lualine/lualine.nvim'}

end)

vim.cmd([[colorscheme gruvbox]])

require("treesitter")
require("devicons")
require("statusline")
require("mappings")

