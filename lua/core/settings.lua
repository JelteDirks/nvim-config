vim.notify("lua/core/settings.lua")

vim.g.colorscheme = "gruvbox"
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.have_nerd_font = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.breakindent = true
vim.opt.hidden = true
vim.opt.laststatus = 2
vim.opt.backupskip = "/tmp/*,/var/*,/private/tmp/*"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes:3"
vim.opt.updatetime = 500
vim.opt.timeoutlen = 500
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.o.termguicolors = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.colorcolumn = "80"
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.inccommand = "split"
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10

vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.api.nvim_create_autocmd({"TextYankPost"}, {
  desc = "Highlight the text that is yanked",
  group = vim.api.nvim_create_augroup("highlight-yanked-text", { clear = true }),
  callback = function(ev)
    vim.highlight.on_yank()
  end,
})

