-- vim.api.nvim_create_autocmd({ "FileType" }, {
--   group = vim.api.nvim_create_augroup("edit_text", { clear = true }),
--   pattern = { "gitcommit", "markdown", "txt","tex" },
--   desc = "Enable spell checking and text wrapping for certain filetypes",
--   callback = function()
--     vim.opt_local.wrap = true
--     vim.opt_local.spelllang=en
--     vim.cmd("setlocal spelllang=en,de")
--     vim.opt_local.spell = true
--   end,
-- })
