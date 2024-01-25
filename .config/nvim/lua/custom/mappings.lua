--local mark = require "harpoon.mark"
--local ui = require "harpoon.ui"
local M = {}

M.dap = {

  plugin = true,
  n = {
    ["<leader>bd"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line",
    },
    ["<leader>rd"] = {
      "<cmd> DapContinue <CR>",
      "Start or continue the debugger",
    },
  },
}
M.general = {
  n = {
    -- Mappings for navigator
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
    --Mappings for movement on buffer
    vim.keymap.set("n", "<C-d>", "<C-d>zz"),

    vim.keymap.set("n", "<C-u>", "<C-u>zz"),

    -- Yank to system clipboard
    vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]]),
    vim.keymap.set("n", "<leader>Y", [["+Y]]),
    vim.keymap.set("n", "<leader>o", "+p"),
    --delete to void register
    vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]]),
    --vim.keymap.set('n', '<leader>ps', function()
    --    telescope.builtin.grep_string({ search = vim.fn.input("Grep > ") })
    --end)

    ["<leader>w"] = { "<cmd> w <CR>", "Save file" },
    vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv"),
    vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv"),
  },
}
-- M.comment = {
--   plugin = true,
--
--   -- toggle comment in both modes
--   n = {
--     ["<leader>/"] = {
--       function()
--         require("Comment.api").toggle.linewise.current()
--       end,
--       "Toggle comment",
--     },
--   },
--
--   v = {
--     ["<leader>c"] = {
--       "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
--       "Toggle comment",
--     },
--   },
-- }
return M
