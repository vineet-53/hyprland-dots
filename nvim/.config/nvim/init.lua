-- formatting buffer
local au = vim.api.nvim_create_autocmd
local ag = vim.api.nvim_create_augroup
local clear_au = vim.api.nvim_clear_autocmds

-- Autoformat on save
local augroup = ag("LspFormatting", { clear = false })
au("BufWritePre", {
  clear_au({ group = augroup, buffer = bufnr }),
  group = augroup,
  buffer = bufnr,
  callback = function()
    vim.lsp.buf.format()
  end,
})
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = vim.api.nvim_create_augroup("coder", { clear = true }),
  pattern = "*",
  command = [[%s/\s\+$//e]],
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "r", "o" })
  end,
})
require("coder.core.options")
require("coder.core.keymaps")
require("coder.lazy")
