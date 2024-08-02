return {
  {
    "stevearc/dressing.nvim",
    event = "vimEnter",
    enabled = true,
    config = function()
      require("dressing").setup()
    end,
  },
}
