return {

  "echasnovski/mini.surround",
  event = "VimEnter",
  recommended = true,
  config = function()
    require("mini.surround").setup({})
    vim.keymap.set("n", "yss", "ys_", { remap = true })
    vim.keymap.set({ "n", "x" }, "s", "<Nop>")
  end,
}
