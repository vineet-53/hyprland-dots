return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    local mason_tool_installer = require("mason-tool-installer")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    -- mason_lspconfig.setup({
    --   -- list of servers for mason to install
    --   ensure_installed = {
    --     "tsserver",
    --     "html",
    --     "cssls",
    --     "tailwindcss",
    --     "svelte",
    --     "lua_ls",
    --     "graphql",
    --     "emmet_ls",
    --     "prismals",
    --     "pyright",
    --   },
    -- })

    mason_lspconfig.setup({
      auto_install = true,
      ensure_installed = {
        "lua_ls",
        "clangd",
        "tsserver",
        "rust_analyzer",
        "html",
        "cssls",
        "svelte",
        "prismals",
        "pyright",
        "bashls",
        "yamlls",
        "gopls",
        "jsonls",
      },
    })

    -- mason_tool_installer.setup({
    --   ensure_installed = {
    --     "prettier", -- prettier formatter
    --     "stylua", -- lua formatter
    --     "isort", -- python formatter
    --     "black", -- python formatter
    --     "pylint",
    --     "eslint_d",
    --   },
    -- })
    mason_tool_installer.setup({
      ensure_installed = {
        "prettierd",
        "stylua",
        "isort",
        "black",
        "eslint-lsp",
        "pylint",
        "eslint_d",
      },
    })
  end,
}
