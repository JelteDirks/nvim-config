vim.api.nvim_exec([[language en_US]], false)

require('set')

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

    -- lsp setup goes here
    use {'neovim/nvim-lspconfig'}
end)

vim.cmd([[colorscheme gruvbox]])

require("treesitter")
require("devicons")
require("statusline")
require("mappings")

