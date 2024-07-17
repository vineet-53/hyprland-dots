return{
		"ThePrimeagen/refactoring.nvim",
   dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      vim.keymap.set("n" ,  "<leader>f" , function()
					require("refactoring").select_refactor({
						show_success_message = true,
					})
				end,
      {	noremap = true,
				silent = true,})
  end
	}
