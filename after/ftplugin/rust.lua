vim.notify("lua/after/plugin/rust.lua", vim.log.levels.INFO)

local bufnr = vim.api.nvim_get_current_buf()

local function vmap(lhs, rhs, opts)
  opts.buffer = bufnr
  vim.keymap.set("v", lhs, rhs, opts)
end

local function nmap(lhs, rhs, opts)
  opts.buffer = bufnr
  vim.keymap.set("n", lhs, rhs, opts)
end

vmap("<Space>rjl", function()
  vim.cmd.RustLsp("joinLines")
end, { desc = "Join next line with cursor line smartly (RustLsp)" });

nmap("<Space>rjl", function()
  vim.cmd.RustLsp("joinLines")
end, { desc = "Join next line with cursor line smartly (RustLsp)" });

nmap("J", function() -- remap J
  vim.cmd.RustLsp("joinLines")
end, { desc = "Join next line with cursor line smartly (RustLsp)" });

nmap("<Space>rod", function()
  vim.cmd.RustLsp("openDocs")
end, { desc = "Open docs.rs documentation for item under cursor (RustLsp)" });

nmap("<Space>roc", function()
  vim.cmd.RustLsp("openCargo")
end, { desc = "Open Cargo.toml file for this project (RustLsp)" });

nmap("<Space>rrd", function()
  vim.cmd.RustLsp("relatedDiagnostics")
end, { desc = "Go to diagnostic related to the diagnostic in the current line (RustLsp)" });

nmap("<Space>rld", function()
  vim.cmd.RustLsp({ "renderDiagnostic", "current" })
end, { desc = "Render diagnostics from cargo build in a hover window. (RustLsp)" });

