vim.cmd("let g:netrw_liststyle = 3")
local opt = vim.opt

opt.number = true
-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
-- opt.autoindent = true -- copy indent from current line when starting new one

opt.wrap = false

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- opt.cursorline = true

-- turn on termguicolors for tokyonight colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
-- opt.swapfile = false
-- Options are automatically loaded before lazy.nvim startup
-- Default options tjhat are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.clipboard = ""
-- vim.g.cursor = "block"
-- vim.opt.guicursor = ""
-- vim.scriptencoding = "utf-8"
-- vim.opt.encoding = "utf-8"
-- vim.opt.fileencoding = "utf-8"
-- vim.opt.number = true
-- vim.opt.title = true
-- vim.opt.autoindent = true
-- vim.opt.smartindent = true
-- vim.opt.hlsearch = true
-- vim.opt.scrolloff = 8
-- vim.opt.inccommand = "split"
-- vim.opt.wrap = false
-- vim.opt.backspace = { "start", "eol", "indent" }
-- vim.opt.wildignore:append({ "*/node_modules/*" })
-- vim.opt.splitbelow = true
-- vim.opt.splitright = true
vim.opt.splitkeep = "cursor"
-- vim.opt.mouse = ""
vim.opt.formatoptions:remove({ "o" })
