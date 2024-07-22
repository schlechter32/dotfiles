-- vim.g.format_on_save = 1
--
vim.cmd [[
  command! EnableFormatOnSave lua vim.g.format_on_save = 1
  command! DisableFormatOnSave lua vim.g.format_on_save = 0
  command! Format lua vim.lsp.buf.format()
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
--
-- Function to print current LSP settings
function Print_lsp_settings()
  local clients = vim.lsp.get_active_clients()
  if next(clients) == nil then
    print("No active LSP clients.")
    return
  end
  for _, client in ipairs(clients) do
    print("Client: " .. client.name)
    print(vim.inspect(client.config.settings))
  end
end

-- Bind the function to a command
vim.cmd("command! LspPrintSettings lua print_lsp_settings()")
