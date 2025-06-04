vim.diagnostic.config({
  virtual_text = {
    current_line = true,
  },
})

local hide_diag_group = vim.api.nvim_create_augroup("hide-diagnostics", { clear = true })
vim.api.nvim_create_autocmd("InsertEnter", {
  group = hide_diag_group,
  callback = function()
    vim.diagnostic.enable(false)
  end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
  group = hide_diag_group,
  callback = function()
    vim.diagnostic.enable(true)
  end,
})
