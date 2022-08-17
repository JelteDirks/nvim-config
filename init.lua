vim.api.nvim_exec([[language en_US]], false)

require('set')

vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

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

    use {'williamboman/mason.nvim'}
    use {'williamboman/mason-lspconfig.nvim'}
    use {'neovim/nvim-lspconfig'}
end)

vim.cmd([[colorscheme gruvbox]])

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "sumneko_lua",
        "rust_analyzer",
        "clangd",
        "cmake",
        "cssls",
        "dockerls",
        "gopls",
        "html",
        "jsonls",
        "tsserver",
        "marksman",
        "intelephense",
        "taplo",
        "yamlls",
    },
    automatic_installation = true,
})

require("treesitter")
require("devicons")
require("statusline")
require("mappings")
