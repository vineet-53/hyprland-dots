vim.cmd("let g:netrw_liststyle = 3")
local opt = vim.opt

vim.opt.guicursor = ""
opt.number = true
-- tabs & indentation
opt.rnu = true

opt.tabstop = 4 -- 2 spaces for tabs (prettier default)

opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.wrap = true
-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive
opt.smartindent = true -- if you include mixed case in your search, assumes you want case-sensitive
opt.incsearch = true

opt.scrolloff = 8
opt.updatetime = 50
opt.termguicolors = true
opt.signcolumn = "yes" -- show sign column so that text doesn't shift
opt.colorcolumn = "80"
-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

vim.opt.clipboard = ""
vim.opt.splitkeep = "cursor"
vim.opt.formatoptions:remove({ "r", "o" })
-- vim.opt.guicursor = {
--   "n-v-c:block", -- Normal, visual, command-line: block cursor
--   "i-ci-ve:ver25", -- Insert, command-line insert, visual-exclude: vertical bar cursor with 25% width
--   "r-cr:hor20", -- Replace, command-line replace: horizontal bar cursor with 20% height
--   "o:hor50", -- Operator-pending: horizontal bar cursor with 50% height
--   "a:blinkwait700-blinkoff400-blinkon250", -- All modes: blinking settings
--   "sm:block-blinkwait175-blinkoff150-blinkon175", -- Showmatch: block cursor with specific blinking settings
-- }
