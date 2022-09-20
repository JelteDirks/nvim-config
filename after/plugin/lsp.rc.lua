print("load after/plugin/lsp.rc.lua")
local status, lsp = pcall(require, "lspconfig")
if (not status) then
  print("lspconfig not found")
end

local on_attach = function()
  vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
  -- add more keymaps to make it useful
end

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
  }
})

lsp["tsserver"].setup({
  on_attach = on_attach,
})

lsp["ltex"].setup({
  on_attach = on_attach,
})

lsp["r_language_server"].setup({
  on_attach = on_attach,
})
