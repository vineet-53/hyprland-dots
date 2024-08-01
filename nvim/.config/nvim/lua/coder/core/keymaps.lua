vim.g.mapleader = " "
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "x", '"_x')
-- Increment / Decrement
vim.keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
vim.keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement
vim.keymap.set("n", "<leader>a", "gg^vG$")
-- move line up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- cursor don't move at end easily
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<Tab>", "%")

-- cursor in center while scrolling
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "{", "{zz")
vim.keymap.set("n", "}", "}zz")
vim.keymap.set("n", "N", "Nzz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "G", "Gzz")
vim.keymap.set("n", "gg", "ggzz")
vim.keymap.set("n", "gd", "gdzz")
-- vim.keymap.set("n", "<C-i>", "<C-i>zz")
vim.keymap.set("n", "<C-o>", "<C-o>zz")
vim.keymap.set("n", "%", "%zz")
vim.keymap.set("n", "*", "*zz")
vim.keymap.set("n", "#", "#zz")

-- quick write , save and exit
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { silent = false })
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { silent = false })
vim.keymap.set("n", "<leader>z", "<cmd>wq<cr>", { silent = false })

-- find and replace
vim.keymap.set({ "n", "v" }, "S", function()
  local cmd = ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>"
  local keys = vim.api.nvim_replace_termcodes(cmd, true, false, true)
  vim.api.nvim_feedkeys(keys, "n", false)
end)

vim.keymap.set("n", "<leader>S", function()
  require("spectre").toggle()
end)

--start and end nvaigation
vim.keymap.set("n", "L", "$")
vim.keymap.set("n", "H", "^")

-- greatest remap ever pasting but not changing the register
vim.keymap.set("x", "<leader>p", [["_dP]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Oil lua
-- vim.keymap.set("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>")

-- move windows
vim.keymap.set("n", "sv", "<C-w>v")
vim.keymap.set("n", "ss", "<C-w>s")
vim.keymap.set("n", "sx", "<C-w><C-o>")
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set({ "n", "v" }, ";y", [["+y]])
vim.keymap.set({ "n", "v" }, ";d", [["+d]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Resize window using <ctrl> arrow keys
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
-- vim.keymap.set({ "v", "i" }, "ii", "<Esc>")
-- for input delay
--
vim.keymap.set("t", "<space>", "<space>")
-- git signs
vim.keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<cr>")
vim.keymap.set("n", "<leader>gf", function()
  local cmd = {
    "sort",
    "-u",
    "<(git diff --name-only --cached)",
    "<(git diff --name-only)",
    "<(git diff --name-only --diff-filter=U)",
  }

  local utils = {}
  utils.is_git_directory = function()
    local result = vim.fn.system("git rev-parse --is-inside-work-tree")
    if vim.v.shell_error == 0 and result:find("true") then
      return true
    else
      return false
    end
  end
  if not utils.is_git_directory() then
    vim.notify(
      "Current project is not a git directory",
      vim.log.levels.WARN,
      { title = "Telescope Git Files", git_command = cmd }
    )
  else
    require("telescope.builtin").git_files()
  end
end, { desc = "Search [G]it [F]iles" })
