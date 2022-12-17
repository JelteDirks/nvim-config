print("load after/plugin/lsp.rc.lua")
local status, lsp = pcall(require, "lspconfig")
if (not status) then
  print("lspconfig not found")
end

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>d", vim.diagnostic.setloclist)

local on_attach = function()
  vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {buffer=0})
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0})
  vim.keymap.set("n", "gr", vim.lsp.buf.references, {buffer=0})

  vim.keymap.set("n", "<c-k>", vim.lsp.buf.signature_help, {buffer=0})
  vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, {buffer=0})
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {buffer=0})
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {buffer=0})
  vim.keymap.set("n", "<leader>f", vim.lsp.buf.formatting, {buffer=0})
end

local status2, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if (not status2) then
  print("cmp_nvim_lsp not found")
end

local capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())

lsp["sumneko_lua"].setup({
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true)
      }
    }
  },
  capabilities = capabilities,
})

lsp["tsserver"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lsp["ltex"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lsp["rust_analyzer"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lsp["pyright"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lsp["clangd"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

