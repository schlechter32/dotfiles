-- vim.g.format_on_save = 1
--
vim.cmd [[
  command! EnableFormatOnSave lua vim.g.format_on_save = 1
  command! DisableFormatOnSave lua vim.g.format_on_save = 0
]]

-- vim.api.nvim_create_autocmd("BufWritePre", {
--   group = vim.api.nvim_create_augroup("format_on_save", { clear = true }),
--   pattern = "*",
--   desc = "Run LSP formatting on a file on save",
--   callback = function()
--     if vim.fn.exists ":Format" > 0 and vim.g.format_on_save == 1 then
--       vim.cmd.Format()
--     end
--   end,
-- })
