return {
  "stevearc/oil.nvim",
  config = function()
    local oil = require("oil")
    vim.keymap.set("n", "<leader>e", oil.toggle_float, { desc = "open explorer" })
    vim.keymap.set("n", "t", oil.select, { desc = "select the file" })
    -- vim.keymap.set("n", "<C-w><C-h>", oil.toggle_hidden, { desc = "toggle hidden files" })
    oil.setup()
  end,
}
