vim.g.mapleader = " "
local keymap = vim.keymap -- for conciseness
local opts = { noremap = true, silent = true }
-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<C-s>v", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<C-s>s", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
-- keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
-- keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
-- keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
-- keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
-- keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
-- keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
-- exit nvim
vim.keymap.set("n", "<C-c>", "<cmd>:qa<CR><cmd>:qa<CR>")
vim.keymap.set("n", "<leader><leader>", function()
  return "<cmd>:source ~/.config/nvim/init.lua<CR>"
end)
-- move down the line or up to the line
vim.keymap.set("v", "J", ":m .-2<CR>==")
vim.keymap.set("v", "K", ":m .+1<CR>==")

-- vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
vim.keymap.set("n", "<leader>!", "<cmd>:q!<CR>", { desc = "Quit the file without Saving" })

-- vim.keymap.set("n", "Q", "<nop>")
-- This is going to get me cancelled
-- vim.keymap.set("i", "<C-c>", "<Esc>")
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- format
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<leader>k", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>K", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>J", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<A-l>", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set("n", "<C-Tab>", "<C-^>")
vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/coder/core/keymaps.lua<CR>")
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>")

-- move windows
-- vim.keymap.set("n", "sv", "<C-w>v")
-- vim.keymap.set("n", "ss", "<C-w>s")
-- vim.keymap.set("n", "sx", "<C-w><C-o>")
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
