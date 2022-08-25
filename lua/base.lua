print('load lua/base.lua')

---- indenting with 2 spaces
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true -- expand tab to spaces
vim.opt.smartindent = true
vim.opt.autoindent = true -- experiment with automatic indenting (TEST PHASE)
----

vim.opt.exrc = false -- disable reading of vimrc / exrc / gvimrc etc

vim.opt.relativenumber = true -- show relative numbers wrt cursor
vim.opt.number = true -- line I am on shows line number of file

vim.opt.cursorline = true -- show thinck cursor

vim.opt.termguicolors = true -- show nice colors

vim.opt.hidden = true -- dont unload buffer when it is abandoned

vim.opt.scrolloff = 10 -- scrolloffset lines when cursor reaches end of screen

vim.opt.signcolumn = 'yes' -- keep signcolumn fixed

vim.opt.colorcolumn = '80' -- show a color column at 80 characters

vim.opt.termguicolors = true -- add nice colors (also fix term emulator)

vim.opt.background = 'dark' -- without theme, use a dark background

vim.opt.incsearch = true -- show/highlight the search matches as I am typing

vim.opt.hlsearch = false -- remove highlights once the search is done

vim.opt.errorbells = false -- no sounds please

vim.opt.wrap = true -- wrap long lines on the screen (TEST PHASE)

vim.opt.showcmd = true -- show (partial) cmd in last line of screen

vim.opt.cmdheight = 1 -- command height is 1 line

vim.opt.laststatus = 2 -- always show status line for last window

vim.opt.shell = "/bin/zsh" -- the shell I use

vim.opt.backupskip = "/tmp/*,/var/*,/private/tmp/*" -- dont set backup for files that match this

vim.opt.breakindent = true -- wrapped lines start at the start of the previous line

vim.opt.backspace = "indent" -- allow backspacing over autoindent (TEST PHASE)

vim.opt.wildignore:append { "*/node_modules/*", "*/target/*" } -- ignore these patterns while expanding

vim.g.mapleader = ' ' -- remapped keys leader is space

