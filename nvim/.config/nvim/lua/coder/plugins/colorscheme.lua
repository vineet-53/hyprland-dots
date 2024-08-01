function ColorMyPencils(color)
  color = color or "rose-pine-moon"
  vim.cmd.colorscheme(color)
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
  {
    "ellisonleao/gruvbox.nvim",
    config = function()
      ColorMyPencils("gruvbox")
    end,
  },
  {
    "Mofiqul/vscode.nvim",
    lazy = true,
    enabled = false,
    config = function()
      vim.o.background = "dark"
      local c = require("vscode.colors").get_colors()
      require("vscode").setup({
        italic_comments = false,
        underline_links = true,
        disable_nvimtree_bg = true,
        color_overrides = {},
        group_overrides = {
          Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
        },
      })
      vim.cmd.colorscheme("vscode")
    end,
  },
  {
    "catppuccin/nvim",
    enabled = false,
    config = function()
      require("catppuccin").setup({
        integrations = {
          cmp = true,
          fidget = true,
          gitsigns = true,
          harpoon = true,
          indent_blankline = {
            enabled = false,
            scope_color = "sapphire",
            colored_indent_levels = false,
          },
          mason = true,
          native_lsp = { enabled = true },
          noice = true,
          notify = true,
          symbols_outline = true,
          telescope = true,
          treesitter = true,
          treesitter_context = true,
        },
      })

      vim.cmd.colorscheme("catppuccin-macchiato")

      -- Hide all semantic highlights until upstream issues are resolved (https://github.com/catppuccin/nvim/issues/480)
      for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
        vim.api.nvim_set_hl(0, group, {})
      end
    end,
  },
}
