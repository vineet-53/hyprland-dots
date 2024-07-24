vim.cmd("let g:netrw_liststyle = 3")
local opt = vim.opt

opt.number = true
-- tabs & indentation
opt.relativenumber = true

opt.tabstop = 4 -- 2 spaces for tabs (prettier default)

opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.wrap = true
-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive
opt.incsearch = true
opt.scrolloff = 8
opt.updatetime = 50
opt.termguicolors = true
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

vim.opt.clipboard = ""
vim.opt.splitkeep = "cursor"
vim.opt.formatoptions:remove({ "r", "o" })
