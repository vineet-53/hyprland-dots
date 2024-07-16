return {
  "ThePrimeagen/harpoon",

  config = function()
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")
    vim.keymap.set("n", ";a", mark.add_file)
    vim.keymap.set("n", ";h", ui.toggle_quick_menu)
    vim.keymap.set("n", ";n", ui.nav_next)
    vim.keymap.set("n", ";p", ui.nav_prev)
    vim.keymap.set("n", ";1", function()
      ui.nav_file(1)
    end)
    vim.keymap.set("n", ";2", function()
      ui.nav_file(2)
    end)
    vim.keymap.set("n", ";3", function()
      ui.nav_file(3)
    end)
    vim.keymap.set("n", ";4", function()
      ui.nav_file(4)
    end)
  end,
}
