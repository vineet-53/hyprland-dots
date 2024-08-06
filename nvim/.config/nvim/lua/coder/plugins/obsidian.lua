return {
  "epwalsh/obsidian.nvim",
  config = function()
    require("obsidian").setup({
      workspaces = {
        {
          name = "Notes",
          path = "~/Documents/Obsidian-Notes/",
        },
      },
    })
  end,
}
