vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.o.signcolumn = "yes"
vim.opt.tabstop = 2
vim.opt.swapfile = false
vim.o.winborder = "rounded"
vim.opt.clipboard = "unnamed,unnamedplus"
vim.g.mapleader = " "
vim.cmd [[set completeopt+=menuone,noselect,popup]]
vim.keymap.set('n', "<leader>o", ':update<CR> :source<CR>')
vim.keymap.set('n', "<leader>w", ':write<CR>')
vim.keymap.set('n', "<leader>q", ':quit<CR>')
vim.keymap.set('n', "<leader>lf", vim.lsp.buf.format)
--vim.opt.completeopt = {  "noselect" }

vim.pack.add({
	{ src = "https://github.com/vague-theme/vague.nvim.git" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/echasnovski/mini.pick" },
	{ src = "https://github.com/nvim-mini/mini.comment" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/alexghergh/nvim-tmux-navigation" },
	{ src = "https://github.com/saghen/blink.cmp",               version = "1.7.0" },
})

-- vim.api.nvim_create_autocmd('LspAttach', {
-- 	callback = function(ev)
-- 		local client = vim.lsp.get_client_by_id(ev.data.client_id)
-- 		if client:supports_method('textdocument/completion') then
-- 			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
-- 		end
-- 	end,
-- })
local cmp = require "blink.cmp"
cmp.setup(
	{
		keymap = {
			preset = 'default',
			['<CR>'] = cmp.accept({ select = true }), -- Confirm completion on Enter
			['<Tab>'] = cmp.select_next(),
			['<S-Tab>'] = cmp.select_prev(),
		},
	})
require "mini.pick".setup()
require("nvim-tmux-navigation").setup({})
require "oil".setup()
require('mini.comment').setup({
	mappings = {
		comment = '<leader>a', -- toggle comment for current line or visual selection
		comment_line = '<leader>a', -- same as above (redundant but explicit)
		textobject = '<leader>a', -- comment textobject if you use operators
		comment_visual = "<leader>a"
	},
})
vim.keymap.set('n', "<leader> ", ":Pick files<CR>")
vim.keymap.set('n', "<leader>h", ":Pick help<CR>")
vim.keymap.set('n', "<leader>e", require("oil").toggle_float)
vim.keymap.set('n', '<C-j>', ":NvimTmuxNavigateDown<CR>")
vim.keymap.set('n', '<C-h>', ":NvimTmuxNavigateLeft<CR>")
vim.keymap.set('n', '<C-k>', ":NvimTmuxNavigateUp<CR>")
vim.keymap.set('n', '<C-l>', ":NvimTmuxNavigateRight<CR>")
vim.cmd("colorscheme vague")
vim.cmd("hi statusline guibg=NONE")

vim.lsp.enable({ "lua_ls", "basedpyright" })
vim.lsp.config("lua_ls",
	{
		settings = {
			Lua = {
				workspace = {
					library = vim.api.nvim_get_runtime_file("", true),
				}
			}
		}
	})
