-- Keymaps
vim.keymap.set("t", "<C-q>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
vim.keymap.set("n", "<leader>o", ":update<CR> :source<CR>")
vim.keymap.set("n", "<leader>w", ":write<CR>")
vim.keymap.set("n", "U", "<C-r>")

-- Centering while moving
local center_keys = { "<C-u>", "<C-f>", "<C-d>", "{", "}", "N", "n", "G", "gg", "<C-i>", "<C-o>", "%", "*", "#" }
for _, k in ipairs(center_keys) do
	vim.keymap.set("n", k, k .. "zz")
end

vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "L", "$")
vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "<leader>no", "<cmd>noh<cr>")

vim.keymap.set("x", "<leader>p", '"_dP')

vim.keymap.set("n", "<leader>f", function()
	require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format buffer" })