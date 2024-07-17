return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local transform_mod = require("telescope.actions.mt").transform_mod

    local trouble = require("trouble")
    local trouble_telescope = require("trouble.sources.telescope")

    -- or create your custom action
    local custom_actions = transform_mod({
      open_trouble_qflist = function(prompt_bufnr)
        trouble.toggle("quickfix")
      end,
    })

    telescope.setup({
      defaults = {
          layout_strategy = "vertical",
          layout_config = { prompt_position = "top" },
          sorting_strategy = "ascending",
          winblend = 0,
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-p>"] = actions.move_selection_previous, -- move to prev result
            ["<C-n>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
            ["<C-t>"] = trouble_telescope.open,
          },
        },
      },
    })

    telescope.load_extension("fzf")
      local builtin = require("telescope.builtin")
        vim.keymap.set("n", ";f", builtin.find_files, { desc = "[S]earch [F]iles" })
        vim.keymap.set("n", ";g", builtin.live_grep, { desc = "[G]rep String" })
        -- vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
        -- vim.keymap.set("n", "", builtin.buffers, { desc = "[ ] Find existing buffers" })
        vim.keymap.set("n", "[h", builtin.help_tags, { desc = "[S]earch [H]elp" })
        vim.keymap.set("n", ";o", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
        vim.keymap.set("n", ";e", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
        vim.keymap.set("n", ";r", builtin.resume, { desc = "[S]earch [R]esume" })
        vim.keymap.set("n", ";s", builtin.grep_string, { desc = "[S]earch current [W]ord" })
        -- vim.keymap.set('n', '', builtin.keymaps, { desc = '[S]earch [K]eymaps' })

        -- Enable Telescope extensions if they are installed
        pcall(require("telescope").load_extension, "fzf")
        pcall(require("telescope").load_extension, "ui-select")

        -- Slightly advanced example of overriding default behavior and theme
        vim.keymap.set("n", ";ds", function()
          -- You can pass additional configuration to Telescope to change the theme, layout, etc.
          builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
            winblend = 10,
            previewer = false,
          }))
        end, { desc = "[/] Fuzzily search in current buffer" })

        -- It's also possible to pass additional configuration options.
        --  See `:help telescope.builtin.live_grep()` for information about particular keys
        vim.keymap.set("n", ";dg", function()
          builtin.live_grep({
            grep_open_files = true,
            prompt_title = "Live Grep in Open Files",
          })
        end, { desc = "[S]earch [/] in Open Files" })

        -- Shortcut for searching your Neovim configuration files
        vim.keymap.set("n", ";df", function()
          builtin.find_files({ cwd = vim.fn.expand("%:p:h") })
        end, { desc = "[S]earch [N]eovim files" })
  end,
}
