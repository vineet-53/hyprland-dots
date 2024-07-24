function ColorMyPencils(color)
  color = color or "rose-pine"
  vim.cmd.colorscheme(color)
  vim.api.nvim_set_hl(0, "Normal", { bg = "black" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "black" })
end

if false then
  return {
    "navarasu/onedark.nvim",
    event = "VimEnter",
    enabled = true,
    config = function()
      require("onedark").setup({
        style = "warmer", -- The theme comes in three styles, `darker`, `moon`, a darker variant `night` and `day`
        transparent = true, -- Enable this to disable setting the background color
        terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
        code_style = {
          comments = "none",
          keywords = "none",
          functions = "bold",
          strings = "none",
          variables = "none",
        },
      })
      ColorMyPencils("onedark")
    end,
  }
end
if false then
  return {

    {
      "erikbackman/brightburn.vim",
    },

    {
      "folke/tokyonight.nvim",
      config = function()
        require("tokyonight").setup({
          style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
          transparent = true, -- Enable this to disable setting the background color
          terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
          styles = {
            comments = { italic = false },
            keywords = { italic = false },
            functions = { bold = true },
            sidebars = "dark", -- style for sidebars, see below
            floats = "dark", -- style for floating windows
          },
        })
      end,
    },

    {
      "rose-pine/neovim",
      name = "rose-pine",
      config = function()
        require("rose-pine").setup({
          disable_background = true,
          styles = {
            italic = false,
          },
        })
        ColorMyPencils("rose-pine")
      end,
    },
  }
end
if true then
  return {
    {
      "catppuccin/nvim",
      lazy = false,
      name = "catppuccin",
      priority = 1000,

      config = function()
        vim.cmd.colorscheme("catppuccin-mocha")
        require("catppuccin").setup({
          styles = {
            italic = false,
            comments = { "NONE" },
            functions = { "bold" },
            properties = { "italic" },
          },
          integrations = {
            cmp = true,
            gitsigns = true,
            nvimtree = true,
            treesitter = true,
            notify = false,
            neotree = true,
            dap = true,
            mini = {
              enabled = true,
              indentscope_color = "",
            },
          },
        })
      end,
    },
  }
end
