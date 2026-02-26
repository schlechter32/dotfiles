return {
	{
		"nvim-mini/mini.ai",
		version = false,
		opts = {},
		dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
	},

	{
		"nvim-mini/mini.surround",
		version = false,
		opts = {
			mappings = {
				add = "ma", -- Add surrounding in Normal and Visual modes
				delete = "md", -- Delete surrounding
				find = "mf", -- Find surrounding (to the right)
				find_left = "mF", -- Find surrounding (to the left)
				highlight = "mh", -- Highlight surrounding
				replace = "mr", -- Replace surrounding

				suffix_last = "l", -- Suffix to search with "prev" method
				suffix_next = "n", -- Suffix to search with "next" method
			},
		},
	},
	{
		"nvim-mini/mini.comment",
		version = false,
		opts = {
			options = {
				custom_commentstring = function()
					local ft = vim.bo.filetype
					if ft == "json" or ft == "jsonc" then
						return "// %s"
					end
					return nil
				end,
			},

			mappings = {
				comment = "<leader>a",
				comment_line = "<leader>a",
				textobject = "<leader>a",
				comment_visual = "<leader>a",
			},
		},
	},
	-- TODO: surround
}