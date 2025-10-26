vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.o.signcolumn = "yes"
vim.opt.tabstop = 2
vim.opt.swapfile = false
vim.o.winborder = "rounded"
vim.opt.clipboard = "unnamed,unnamedplus"
vim.g.mapleader = " "
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.cmd [[set completeopt+=menuone,noselect,popup]]
vim.keymap.set('n', "<leader>o", ':update<CR> :source<CR>')
vim.keymap.set('n', "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set('n', "<leader>w", ':write<CR>')

-- Save and Quit with leader key
vim.keymap.set('n',"<leader>z", "<cmd>wq<cr>", { silent = false }, { desc = "Save and close Buffer" })
vim.keymap.set('n', "<leader>q", ':quit<CR>')
vim.keymap.set('n', "<leader>lf", vim.lsp.buf.format)
vim.keymap.set('n', "<leader>d", vim.diagnostic.open_float)
vim.keymap.set('v',"<C-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set('v',"<C-k>", ":m '<-2<CR>gv=gv")

vim.keymap.set('v',"<C-n>", "<cmd>tabprevious<cr>")
vim.keymap.set('v',"<C-p>", "<cmd>tabnext<cr>")
vim.keymap.set('i', 'jj','<esc>')
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)
vim.keymap.set('n', '<leader>rr', vim.lsp.buf.references)
--

-- Center buffer while navigating
vim.keymap.set('n',"<C-u>", "<C-u>zz")
vim.keymap.set('n',"<C-f>", "<C-u>zz")
vim.keymap.set('n',"<C-d>", "<C-d>zz")
vim.keymap.set('n',"{", "{zz")
vim.keymap.set('n',"}", "}zz")
vim.keymap.set('n',"N", "Nzz")
vim.keymap.set('n',"n", "nzz")
vim.keymap.set('n',"G", "Gzz")
vim.keymap.set('n',"gg", "ggzz")
vim.keymap.set('n',"<C-i>", "<C-i>zz")
vim.keymap.set('n',"<C-o>", "<C-o>zz")
vim.keymap.set('n',"%", "%zz")
vim.keymap.set('n',"*", "*zz")
vim.keymap.set('n',"#", "#zz")
-- Press 'H', 'L' to jump to start/end of a line (first/last char)
vim.keymap.set('n',"L", "$")
vim.keymap.set('n',"H", "^")
vim.keymap.set('n',"<leader>no", "<cmd>noh<cr>")

-- Navigate to next qflist item
vim.keymap.set('n',"<leader>cn", ":cnext<cr>zz")

-- Navigate to previos qflist item
vim.keymap.set('n',"<leader>cp", ":cprevious<cr>zz")

-- Open the qflist
vim.keymap.set('n',"<leader>co", ":copen<cr>zz")

-- Close the qflist
vim.keymap.set('n',"<leader>cc", ":cclose<cr>zz")
vim.keymap.set('x',"<leader>p", '"_dP')
--vim.opt.completeopt = {  "noselect" }
vim.pack.add({
	{ src = "https://github.com/vague-theme/vague.nvim.git" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/echasnovski/mini.pick" },
	{ src = "https://github.com/nvim-mini/mini.comment" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter",            version = "v0.10.0" },
	{ src = "https://github.com/alexghergh/nvim-tmux-navigation" },
	{ src = "https://github.com/saghen/blink.cmp",                           version = "v1.7.0" },
	{ src = "https://github.com/nvim-mini/mini.ai" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects" },
	{ src = "https://github.com/williamboman/mason.nvim" }

})
require("lua/lazygit_float")
vim.keymap.set("n", "<leader>lg", function()
  require("lua/lazygit_float").open()
end, { desc = "Open LazyGit in float" })

require('mason').setup()
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
		signature = { enabled = true },
		keymap = {
			preset = 'enter',
			['<C-K>'] = { 'show_signature', 'hide_signature', 'fallback' },
			['<S-Tab>'] = { 'select_prev', 'fallback_to_mappings' },
			['<Tab>'] = { 'select_next', 'fallback_to_mappings' },
			-- ['<CR>'] = cmp.accept({ select = true }), -- Confirm completion on Enter
			-- ['<Tab>'] = cmp.select_next(),
			-- ['<S-Tab>'] = cmp.select_prev(),
		},
	})
-- choose            = '<CR>',
-- choose_in_split   = '<C-s>',
-- choose_in_tabpage = '<C-t>',
-- choose_in_vsplit  = '<C-v>',
-- choose_marked     = '<M-CR>',
--
vim.cmd("hi statusline guibg=NONE")
require("vague").setup({
	colors = {
		comment = "#ebaeae", }
})
vim.cmd.colorscheme("vague")
require("mini.ai").setup()
require "mini.pick".setup()
require("nvim-tmux-navigation").setup({})
-- require "oil".setup()
require("oil").setup({
	lsp_file_methods = {
		enabled = true,
		timeout_ms = 1000,
		autosave_changes = true,
	},
	columns = {
		"permissions",
		"icon",
	},
	float = {
		max_width = 0.7,
		max_height = 0.6,
		border = "rounded",
	},
})

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
vim.lsp.enable({ "lua_ls", "basedpyright", "julials", "ltext_plus" })

vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
	pattern = "*",
	desc = "Highlight selection on yank",
	callback = function()
		vim.highlight.on_yank({ timeout = 200, visual = true })
	end,
})
local util = require('lspconfig.util')

local root = util.root_pattern('Project.toml')(dir) or vim.fn.getcwd()

vim.lsp.config('ltext_plus', {

	cmd = { 'ltex-ls-plus' },
	-- autostart = false,
	filetypes = {
		"gitcommit",
		"markdown",
		"org",
		-- "plaintex",
		"rst",
		"rnoweb",
		"tex",
		"pandoc",
		"quarto",
		"rmd",
		"context",
		"html",
		"xhtml",
		"mail",
		"text",
	},
})
local cfg = vim.lsp.config('julials', {
	name = 'julials_' .. root,
	cmd = {
		'julia',
		'--startup-file=no',
		'--history-file=no',
		'--project=' .. root,
		vim.fn.stdpath('config') .. '/julials_startup.jl',
	},
	root_dir = root,
	filetypes = { 'julia' },
	on_attach = function(client)
		print('Julia LSP attached: ' .. client.name .. ' with ' .. root)
	end,
})

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
vim.keymap.set('n', '<leader>sg', function()
	local q = vim.fn.input('Grep > ')
	if q ~= '' then
		require('mini.pick').builtin.grep({ pattern = q, preview = { kind = 'vertical' } })
	end
end, { desc = 'Grep with preview' })

---@diagnostic disable: missing-fields
require("nvim-treesitter.configs").setup(
	{

		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<c-space>",
				node_incremental = "<c-space>",
				scope_incremental = "<c-s>",
				node_decremental = "<c-backspace>",
			},
		},
		textobjects = {
			select = {
				enable = true,
				lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
				keymaps = {
					-- You can use the capture groups defined in textobjects.scm
					["aa"] = "@parameter.outer",
					["ia"] = "@parameter.inner",
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["ac"] = "@class.outer",
					["ic"] = "@class.inner",
				},
			},
		},
		autopairs = { enable = true },
		highlight = { enable = true },
		ensure_installed = {
			"bash",
			"c",
			"css",
			"html",
			"javascript",
			"json",
			"julia",
			"latex",
			"lua",
			"markdown",
			"markdown_inline",
			"prisma",
			"python",
			"vim",
			"vimdoc",
			"yaml"
			-- "gleam",
			-- "graphql",
			-- "ocaml",
			-- "ocaml_interface",
			-- "tsx",
			-- "typescript",
		},
	})
local pick = require("mini.pick")

