local autocmd = vim.api.nvim_create_autocmd;
autocmd({"BufWritePre"}, {
    group = vim.api.nvim_create_augroup("coder" , {}),
    pattern = "*",
    command = [[%s/\s\+$//e]],
})
require("coder.core.autocmd")
require("coder.core.options")
require("coder.core.keymaps")
