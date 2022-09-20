print("load after/plugin/mason.rc.lua")
local mstatus, mason = pcall(require, "mason")
if (not mstatus) then
  print("mason not found")
end

mason.setup();

local mlspstatus, mlsp = pcall(require, "mason-lspconfig")
if (not mlspstatus) then
  print("mason-lspconfig not found")
end

mlsp.setup({
  ensure_installed = {
    "sumneko_lua",
    "tsserver",
    "ltex",
    "r_language_server",
    "rust_analyzer",
  }
})
