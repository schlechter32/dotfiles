-------------------------------------------------------------------------------
-- Markdown Previewer
--------------------------------------------------------------------------------

return {
  "iamcco/markdown-preview.nvim",
  ft = "markdown",
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
  cmd = {
    "MarkdownPreviewToggle",
    "MarkdownPreview",
    "MarkdownPreviewStop",
  },
  config = function()
    vim.keymap.set(
      "n",
      "<leader>lv",
      ":MarkdownPreviewToggle<CR>",
      { desc = "MarkdownPreviewToggle", silent = true, noremap = true }
    )
  end,
}
