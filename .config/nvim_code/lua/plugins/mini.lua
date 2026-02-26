return {
	{
		"nvim-mini/mini.ai",
		version = false,
		opts = {},
    deps={"nvim-treesitter/nvim-treesitter-textobjects",},
	},
	{
		"nvim-mini/mini.comment",
		version = false,
		opts = {

			mappings = {
				comment = "<leader>a",
				comment_line = "<leader>a",
				textobject = "<leader>a",
				comment_visual = "<leader>a",
			},
		},
	},
}