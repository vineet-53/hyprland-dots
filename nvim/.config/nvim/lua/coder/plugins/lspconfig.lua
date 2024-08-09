return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "prettier",
        "stylua",
        "isort",
        "black",
        "pylint",
        "eslint_d",
      },
    },
    config = function(_, opts)
      require("mason-tool-installer").setup(opts)
    end,
  },
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
      local mason = require("mason")
      local mason_lspconfig = require("mason-lspconfig")
      mason.setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
        ensure_installed = {
          "markdownlint-cli2",
          "markdown-toc",
        },
      })
      mason_lspconfig.setup({
        auto_install = true,
        ensure_installed = {
          "lua_ls",
          "clangd",
          "tailwindcss",
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
    end,
  },
  {
    "folke/neodev.nvim",
    opts = {},
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "antosha417/nvim-lsp-file-operations",
    },
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require("lspconfig")
      lspconfig.clangd.setup({
        capabilities = capabilities,
      })
      lspconfig.tailwindcss.setup({
        capabilities = capabilities,
      })
      lspconfig.tsserver.setup({
        capabilities = capabilities,
      })
      lspconfig.cssls.setup({
        capabilities = capabilities,
      })
      lspconfig.solargraph.setup({
        capabilities = capabilities,
      })
      lspconfig.html.setup({
        capabilities = capabilities,
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      --- vim auto cmmands
      --   vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      --   vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      --   vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
      --   vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
    end,
  },
  {
    "nvimdev/lspsaga.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    event = "LspAttach",
    config = function()
      require("lspsaga").setup()
    end,
  },
}
