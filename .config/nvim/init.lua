-- Auto-install pack-manager
local pack_path = vim.fn.stdpath("data") .. "/site/pack/core/start/pack-manager.nvim"
if not vim.uv.fs_stat(pack_path) then
	vim.notify("Installing pack-manager.nvim...")
	vim.fn.system({
		"git",
		"clone",
		"--depth=1",
		"https://github.com/GlennMm/pack-manager.nvim.git",
		pack_path,
	})
	vim.cmd("packloadall!")
	vim.notify("Pack-manager installed! Please restart Neovim.")
end

local pack = require("pack-manager")

-- Configure pack-manager
pack.setup({
	auto_install = true,
	show_progress = true,
})
-- Options
vim.opt.number = true
vim.opt.conceallevel = 2
vim.opt.mouse = "a"
vim.opt.guicursor = {
	"n-v:blck", -- Normal, visual, command-line: block cursor
	"i-c-ve:ver25", -- Insert, command-line insert, visual-exclude: vertical bar cursor with 25% width
	"r-cr:hor20", -- Replace, command-line replace: horizontal bar cursor with 20% height
	"o:hor50", -- Operator-pending: horizontal bar cursor with 50% height
	"a:blinkwait700-blinkoff400-blinkon250", -- All modes: blinking settings
	"sm:block-blinkwait175-blinkoff150-blinkon175", -- Showmatch: block cursor with specific blinking settings
}
-- Enable 24-bit color
vim.opt.termguicolors = true
-- Decrease updatetime to 200ms
vim.opt.updatetime = 200
-- Enable ignorecase + smartcase for better searching
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- Better splitting
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.relativenumber = true
vim.opt.wrap = true
vim.o.signcolumn = "yes"
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.swapfile = false
vim.o.winborder = "rounded"
vim.opt.clipboard = "unnamed,unnamedplus"
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.undofile = true
vim.opt.smartindent = true
vim.cmd([[set completeopt+=menuone,noselect,popup]])

vim.keymap.set("t", "<C-q>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
vim.keymap.set("n", "<leader>o", ":update<CR> :source<CR>")
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>w", ":write<CR>")

-- Save and Quit with leader key
vim.keymap.set("n", "<leader>z", "<cmd>wq<cr>", { silent = false }, { desc = "Save and close Buffer" })
vim.keymap.set("n", "<leader>q", ":quit<CR>")
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv")

vim.keymap.set("v", "<C-n>", "<cmd>tabprevious<cr>")
vim.keymap.set("v", "<C-p>", "<cmd>tabnext<cr>")
vim.keymap.set("i", "jj", "<esc>")
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references)
vim.keymap.set("n", "U", "<C-r>")
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "LSP: [G]oto [D]efinition" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "LSP: [G]oto [R]eferences" })
--
--

vim.api.nvim_create_autocmd("VimResized", {
	group = vim.api.nvim_create_augroup("WinResize", { clear = true }),
	pattern = "*",
	command = "wincmd =",
	desc = "Auto-resize windows on terminal buffer resize.",
})
vim.keymap.set("n", "<leader>ok", ":w<cr>:!mv '%:p' $HOME/secondBrain/05Zettelkasten/<cr>:bd<cr>")
vim.keymap.set("n", "<leader>od", ":!rm '%:p'<cr>:bd<cr>", { desc = "Delete bufferfile" })
-- Center buffer while navigating
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-f>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "{", "{zz")
vim.keymap.set("n", "}", "}zz")
vim.keymap.set("n", "N", "Nzz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "G", "Gzz")
vim.keymap.set("n", "gg", "ggzz")
vim.keymap.set("n", "<C-i>", "<C-i>zz")
vim.keymap.set("n", "<C-o>", "<C-o>zz")
vim.keymap.set("n", "%", "%zz")
vim.keymap.set("n", "*", "*zz")
vim.keymap.set("n", "#", "#zz")
-- Press 'H', 'L' to jump to start/end of a line (first/last char)
vim.keymap.set("n", "L", "$")
vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "<leader>no", "<cmd>noh<cr>")

-- Navigate to next qflist item
vim.keymap.set("n", "<leader>cn", ":cnext<cr>zz")

-- Navigate to previos qflist item
vim.keymap.set("n", "<leader>cp", ":cprevious<cr>zz")

-- Open the qflist
vim.keymap.set("n", "<leader>co", ":copen<cr>zz")

-- Close the qflist
vim.keymap.set("n", "<leader>cc", ":cclose<cr>zz")
vim.keymap.set("x", "<leader>p", '"_dP')
local cobra = require("install_on_cobra")

local cobra = require("install_on_cobra") -- returns {} or { {src=...} }

pack.add(vim.list_extend({
	{ src = "https://github.com/vague-theme/vague.nvim.git" },
	{ src = "https://github.com/jmbuhr/otter.nvim.git" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/chentoast/marks.nvim" },
	{ src = "https://github.com/echasnovski/mini.pick" },
	{ src = "https://github.com/nvim-mini/mini.comment" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "v0.10.0" },
	{ src = "nvim-treesitter/nvim-treesitter-context" },
	{ src = "https://github.com/alexghergh/nvim-tmux-navigation" },
	{ src = "https://github.com/saghen/blink.cmp", version = "v1.7.0" },
	{ src = "https://github.com/nvim-mini/mini.ai" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects" },
	{ src = "https://github.com/williamboman/mason.nvim" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/declancm/maximize.nvim" },
	{ src = "https://github.com/MagicDuck/grug-far.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/epwalsh/obsidian.nvim" },
	{ src = "https://github.com/folke/flash.nvim" },
	{ src = "https://github.com/j-hui/fidget.nvim.git" },
	{ src = "iamcco/markdown-preview.nvim" },
	{ src = "https://github.com/kevinhwang91/nvim-bqf.git" },
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim.git" },
}, cobra))
-- Otter: enable for markdown, map julia fences, auto-attach
require("otter").setup({
	buffers = {
		names = { markdown = true }, -- allow otter in markdown
		ft_to_lang = { markdown = { julia = "julia" } }, -- ```julia -> julia LSP
	},
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		require("otter").activate()
	end, -- or :OtterAttach
})
require("fidget").setup({})
require("marks").setup({
	builtin_marks = { "<", ">", "^" },
	refresh_interval = 250,
	sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
	excluded_filetypes = {},
	excluded_buftypes = {},
	mappings = {},
})
vim.keymap.set("n", "M", "`")
local flash = require("flash")
flash.setup({
	label = { rainbow = { enabled = true, shade = 5 } },
	modes = {
		search = { enabled = true },
		char = {
			jump_labels = true,
		},
	},
})
vim.keymap.set({ "n", "x", "o" }, "s", flash.jump, { desc = "Flash" })
vim.keymap.set({ "n", "x", "o" }, "S", flash.treesitter, { desc = "Flash Treesitter" })
vim.keymap.set("o", "r", flash.remote, { desc = "Remote Flash" })
vim.keymap.set({ "o", "x" }, "R", flash.treesitter_search, { desc = "Treesitter Search" })
vim.keymap.set("c", "<C-s>", flash.toggle, { desc = "Toggle Flash Search" })
-- require("markdown-preview.nvim").setup()
vim.keymap.set("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", { desc = "Markdown preview" })
vim.keymap.set("n", "<leader>ma", "<cmd>MarksListAll<CR>", { desc = "List all marks" })
vim.api.nvim_set_hl(0, "FlashBackdrop", { fg = "#555555" }) -- dim gray for background
vim.api.nvim_set_hl(0, "FlashLabel", { fg = "#64eb34", bold = true }) -- green labels
vim.api.nvim_set_hl(0, "FlashMatch", { fg = "#df8e1d", underline = true }) -- yellow matches
require("maximize").setup()
vim.keymap.set("n", "<F3>", require("maximize").toggle)
require("conform").setup({

	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	notify_on_error = true,
	format_after_save = {
		async = true,
		timeout_ms = 500,
		lsp_fallback = true,
	},
	formatters_by_ft = {
		-- javascript = { "prettierd", stop_after_first = true },
		-- typescript = { "prettierd", stop_after_first = true },
		-- typescriptreact = { "prettierd", stop_after_first = true },
		-- svelte = { "prettierd", "prettier ", stop_after_first = true },
		lua = { "stylua" },
		julia = { "runic" },
		python = { "black" },
		latex = { "tex-fmt" },
		tex = { "tex-fmt" },
		markdown = { "pymarkdownlnt" },
		bash = { "beautysh" },
		sh = { "beautysh" },
		nix = { "nixfmt", "alejandra", stop_after_first = true },
		go = { "gofmt" },
	},
})
vim.cmd([[

  command! Format lua require("conform").format()
]])
vim.keymap.set("n", "<leader>f", function()
	require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format buffer" })
require("lazygit_float")
require("obsidian_setup")
require("local_sidekick")
vim.keymap.set("n", "<leader>lg", function()
	require("lazygit_float").open()
end, { desc = "Open LazyGit in float" })
-- vim.keymap.set("n", "<leader>lv", "<cmd>LspTexlabForward<cr>")
require("mason").setup()
-- vim.api.nvim_create_autocmd('LspAttach', {
-- 	callback = function(ev)
-- 		local client = vim.lsp.get_client_by_id(ev.data.client_id)
-- 		if client:supports_method('textdocument/completion') then
-- 			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
-- 		end
-- 	end,
-- })
local cmp = require("blink.cmp")
cmp.setup({
	-- sources = {
	-- 	-- Remove 'buffer' if you don't want text completions, by default it's only enabled when LSP returns no items
	-- 	default = { "lsp", "path", "snippets", "buffer", "obsidian" },
	-- },
	signature = { enabled = true },
	keymap = {
		preset = "enter",
		["<C-K>"] = { "show_signature", "hide_signature", "fallback" },
		["<S-Tab>"] = { "select_prev", "fallback_to_mappings" },
		["<Tab>"] = { "select_next", "fallback_to_mappings" },
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
	on_highlights = function(hl, c)
		hl.Comment = { fg = "#ebaeae", bg = "NONE", italic = true }
		hl.LineNr = { fg = "#ebaeae", bg = "NONE" }
		hl.CurSearch = { fg = "#d20f39", bg = "NONE" }
		hl.IncSearch = { fg = "#64eb34", bg = "NONE" }
		hl.Search = { fg = "#df8e1d", bg = "NONE" }
		hl.Visual = { bg = "#666666" }

		-- override Flash groups to avoid Comment bleed
		hl.FlashBackdrop = { fg = "#9f9f9f" }
		hl.FlashLabel = { fg = "#64eb34", bold = true }
		hl.FlashMatch = { fg = "#df8e1d", underline = true }
	end,
	-- colors = {
	-- 	comment = "#ebaeae",
	-- 	search = "#d20f39",
	-- },
})
vim.cmd.colorscheme("vague")
require("mini.ai").setup()
require("mini.pick").setup()
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

require("mini.comment").setup({
	mappings = {
		comment = "<leader>a", -- toggle comment for current line or visual selection
		comment_line = "<leader>a", -- same as above (redundant but explicit)
		textobject = "<leader>a", -- comment textobject if you use operators
		comment_visual = "<leader>a",
	},
})
vim.keymap.set("n", "<leader> ", ":Pick files<CR>")
vim.keymap.set("n", "<leader>sb", ":Pick buffers<CR>")
vim.keymap.set("n", "<leader>h", ":Pick help<CR>")
vim.keymap.set("n", "<leader>e", require("oil").toggle_float)
vim.keymap.set({ "n", "i", "v", "t" }, "<C-j>", ":NvimTmuxNavigateDown<CR>")
vim.keymap.set({ "n", "i", "v", "t" }, "<C-h>", ":NvimTmuxNavigateLeft<CR>")
vim.keymap.set({ "n", "i", "v", "t" }, "<C-k>", ":NvimTmuxNavigateUp<CR>")
vim.keymap.set({ "n", "i", "v", "t" }, "<C-l>", ":NvimTmuxNavigateRight<CR>")
-- terminal (incl. Sidekick’s terminal)
vim.keymap.set("t", "<C-j>", [[<C-\><C-n><Cmd>NvimTmuxNavigateDown<CR>]], {
	silent = true,
	desc = "Tmux down (terminal)",
})

vim.keymap.set("t", "<C-l>", [[<C-\><C-n><Cmd>NvimTmuxNavigateRight<CR>]], {
	silent = true,
	desc = "Tmux right (terminal)",
})
-- lspconfig helpers
local util = require("lspconfig.util")
vim.lsp.enable({ "marksman", "lua_ls", "basedpyright", "ltext_plus", "texlab", "nil_ls", "jetls" })
-- vim.lsp.config("jetls", {
-- 	cmd = {
-- 		"jetls",
-- 		"--threads=8",
-- 		"--",
-- 	},
-- 	filetypes = { "julia" },
-- })
vim.lsp.config("jetls", {
	cmd = {
		"jetls",
		"--threads=auto",
		"--",
	},
	filetypes = { "julia" },
})
vim.lsp.enable("jetls")
-- vim.lsp.config("jetls", {
-- 	-- Baseline command that already works for you
-- 	cmd = { "jetls", "--threads=auto", "--" },
-- 	filetypes = { "julia" },
-- 	-- Pick a project root for JetLS; fall back to cwd so it never becomes nil
-- 	root_dir = function(fname)
-- 		return util.root_pattern("Project.toml", "Manifest.toml", ".git")(fname) or vim.fn.getcwd()
-- 	end,
-- 	on_new_config = function(new_config, root)
-- 		-- Pass the root as project to JetLS
-- 		new_config.cmd = { "jetls", "--threads=auto", "--project=" .. root }
-- 	end,
-- 	single_file_support = true,
-- })
-- lspconfig.julials.setup({
--   cmd = {
--     "julia",
--     "--startup-file=no",
--     "--history-file=no",
--     "--threads=auto",
--     vim.fn.expand("~") .. "/source/JETLS.jl/runserver.jl",
--   },
--   filetypes = { "julia" },
--   -- pick a real root: Project.toml / Manifest.toml / .git / cwd fallback
--   root_dir = function(fname)
--     return util.root_pattern("Project.toml", "Manifest.toml", ".git")(fname)
--            or vim.fn.getcwd()
--   end,
--   on_new_config = function(new_config, root)
--     -- point JetLS to the project it should index
--     new_config.cmd[3] = "--project=" .. root
--   end,
--   single_file_support = true,
-- })
vim.lsp.enable("jetls")
vim.lsp.enable("copilot")

vim.keymap.set("n", "<leader>lv", "<cmd>LspTexlabForward<cr>")
vim.lsp.config("texlab", {
	-- on_attach = function(_, bufnr)
	-- 	vim.keymap.set("n", "<leader>lv", "<cmd>LspTexlabForward<cr>", {
	-- 		buffer = bufnr,
	-- 		desc = "Forward search (Texlab)",
	-- 	})
	-- end,
	settings = {
		texlab = {
			auxDirectory = "auxfiles",
			outputDirectory = "build",
			pdfDirectory = "build",
			bibtexFormatter = "texlab",
			build = {

				args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
				executable = "latexmk",
				forwardSearchAfter = false,
				onSave = false,

				auxDirectory = "auxfiles",
				outputDirectory = "build",
				pdfDirectory = "build",
			},
			chktex = {
				onEdit = false,
				onOpenAndSave = false,
			},
			diagnosticsDelay = 300,
			formatterLineLength = 80,
			forwardSearch = {
				-- MacOS Skim
				-- executable = "displayline",
				-- args = { "-g", "%l", "%p", "%f" },
				-- Okular Linux
				executable = "okular",
				args = { "--unique", "file:%p#src:%l%f" },

				-- Enable back search on Skim -> Preference -> Sync:
				--   Preset: Custom
				--   Command: /Users/simo/go/bin/nvim-texlabconfig
				--   Arguments: -file '%file' -line %line -cache_root /Users/simo/.cache/lvim
				-- (Commands and Arguments accept only full path, change '/User/simo')
				-- executable = "zathura",
				-- args = {
				--   "--synctex-editor-command",
				--   [[nvim-texlabconfig -file '%%%{input}' -line %%%{line} -server ]] .. vim.v.servername,
				--   "--synctex-forward",
				--   "%l:1:%f",
				--   "%p",
				-- },
				-- executable = 'sioyek',
				-- args = {
				--     '--reuse-window',
				--     '--execute-command', 'toggle_synctex', -- Open Sioyek in synctex mode.
				--     '--inverse-search',
				--     [[nvim-texlabconfig -file %%%1 -line %%%2 -server ]] .. vim.v.servername,
				--     '--forward-search-file', '%f',
				--     '--forward-search-line', '%l', '%p'
				-- }
			},
			latexFormatter = "latexindent",
			latexindent = {
				modifyLineBreaks = true,
			},
		},
	},
})
-- Briefly highlight text after any yank for visual feedback
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
	pattern = "*",
	desc = "Highlight selection on yank",
	callback = function()
		vim.highlight.on_yank({ timeout = 200, visual = true })
	end,
})
vim.lsp.config("ltext_plus", {

	cmd = { "ltex-ls-plus" },
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
		-- "rmd",
		"context",
		"html",
		"xhtml",
		"mail",
		"text",
	},
})
-- vim.lsp.enable("julials")
-- vim.lsp.config("julials", require("julials_config"))
-- local cfg = vim.lsp.config("julials", {
-- 	name = "julials_" .. root,
-- 	cmd = {
-- 		"julia",
-- 		"--startup-file=no",
-- 		"--history-file=no",
-- 		"--project=" .. root,
-- 		vim.fn.stdpath("config") .. "/julials_startup.jl",
-- 	},
-- 	root_dir = root,
-- 	filetypes = { "julia" },
-- 	on_attach = function(client)
-- 		print("Julia LSP attached: " .. client.name .. " with " .. root)
-- 	end,
-- })

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
		},
	},
})
vim.keymap.set("n", "<leader>sg", function()
	local q = vim.fn.input("Grep > ")
	if q ~= "" then
		require("mini.pick").builtin.grep({ pattern = q, preview = { kind = "vertical" } })
	end
end, { desc = "Grep with preview" })

---@diagnostic disable: missing-fields
require("nvim-treesitter.configs").setup({

	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<c-space>",
			node_incremental = "<c-space>",
			-- scope_incremental = "<c-s>",
			node_decremental = "<c-s>",
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
				["ae"] = "@frame.outer",
				["ie"] = "@frame.inner",
				["ab"] = "@block.outer",
				["ib"] = "@block.inner",
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
		-- "latex",
		"lua",
		"markdown",
		"markdown_inline",
		"prisma",
		"python",
		"vim",
		"vimdoc",
		"yaml",
		-- "gleam",
		-- "graphql",
		-- "ocaml",
		-- "ocaml_interface",
		-- "tsx",
		-- "typescript",
	},
})
-- local pick = require("mini.pick")
--
--
