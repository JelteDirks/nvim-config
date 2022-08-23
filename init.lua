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

----- lsp stuff
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "bashls",
        "sumneko_lua",
        "rust_analyzer",
        "cssls",
        "dockerls",
        "html",
        "jsonls",
        "tsserver", -- js / ts
        "marksman", -- markdown
        "intelephense", -- php
        "taplo", -- TOML
        "yamlls",
    },
    automatic_installation = true,
})

local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

local lsp_flags = {
    debounce_text_changes = 100,
}

require('lspconfig')['rust_analyzer'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
}

require('lspconfig')['bashls'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
}

require('lspconfig')['tsserver'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
}
----- end lsp stuff

require("treesitter")
require("devicons")
require("statusline")
require("mappings")
