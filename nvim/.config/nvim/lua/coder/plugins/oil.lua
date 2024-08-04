return {
  "stevearc/oil.nvim",
  config = function()
    local oil = require("oil")
    oil.setup()
    vim.keymap.set("n", "<leader>e", oil.toggle_float, { desc = "toggle oil" },  {silent = true})
    vim.keymap.set("n", "t", oil.select , { desc = "select option" },  {silent = true})
  end,
}
