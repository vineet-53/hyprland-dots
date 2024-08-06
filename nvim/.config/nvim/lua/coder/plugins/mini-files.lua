return {
  "echasnovski/mini.files",
  enabled =false,
  opts = {
    windows = {
      preview = false,
      width_focus = 30,
      width_preview = 100,
    },
    options = {
      use_as_default_explorer = true,
    },
  },
  keys = {
    {
      "<leader>e",
      function()
        require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
      end,
      desc = "Open mini.files (Directory of Current File)",
    },
    {
      "<leader>/",
      function()
        require("mini.files").open(vim.uv.cwd(), true)
      end,
      desc = "Open mini.files (cwd)",
    },
  },
  config = function(_, opts)
    require("mini.files").setup(opts)
  end,
}
