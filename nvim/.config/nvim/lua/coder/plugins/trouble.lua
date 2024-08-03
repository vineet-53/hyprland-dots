return {
  "folke/trouble.nvim",
  dependncies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
  opts = {
    focus = true,
  },
  cmd = "Trouble",
  keys = {
    { "<leader>tt", "<cmd>Trouble diagnostics toggle<CR>", desc = "Open trouble workspace diagnostics" },
    { "[t",  "<cmd>Trouble quickfix next<CR>",      desc = "Open trouble quickfix next" },
    { "]t",  "<cmd>Trouble quickfix prev<CR>",      desc = "Open trouble quickfix previous" },
  },
}
