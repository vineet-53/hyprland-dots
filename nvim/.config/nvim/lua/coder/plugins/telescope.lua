return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local actions = require("telescope.actions")
      local opts = {
        hidden = true,
        themes = "get_ivy",
        layout_strategies = "vertical",
        layout_config = { height = 0.8, width = 0.8, prompt_position = "top" },
        sorting_strategy = "ascending",
        previewer = false,
      }
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown(),
          },
        },
      })

      local builtin = require("telescope.builtin")
      vim.keymap.set("n", ";f", function()
        builtin.find_files(opts)
      end, {})

      vim.keymap.set("n", "<C-p>", function()
        builtin.git_files(opts)
      end, {})

      vim.keymap.set("n", ";g", function()
        builtin.live_grep(opts)
      end, {})

      local builtin = require("telescope.builtin")
      vim.keymap.set("n", ";b", function()
        builtin.buffers(opts)
      end, { desc = "[F]ind Buffers" })

      vim.keymap.set("n", ";s", function()
        builtin.grep_string({ search = vim.fn.input("Grep >> ") })
      end)

      vim.keymap.set("n", ";ds", function()
        builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
          winblend = 10,
          previewer = false,
        }))
      end, { desc = "[/] Fuzzily search in current buffer" })

      vim.keymap.set("n", ";dg", function()
        builtin.live_grep({
          grep_open_files = true,
          prompt_title = "Live Grep in Open Files",
        })
      end, { desc = "[S]earch [/] in Open Files" })

      vim.keymap.set("n", ";df", function()
        builtin.find_files({ cwd = vim.fn.expand("%:p:h") })
      end, { desc = "[S]earch [N]eovim files" })
      require("telescope").load_extension("ui-select")
    end,
  },
}
