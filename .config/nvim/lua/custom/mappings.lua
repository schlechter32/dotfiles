--local mark = require "harpoon.mark"
--local ui = require "harpoon.ui"
local M = {}

-- Function to open the file under the cursor in Okular without blocking Neovim
function OpenFileInOkular()
    -- Get the filename under the cursor
    local file = vim.fn.expand("<cfile>")
    
    -- Define the command to open the file in Okular
    local cmd = "okular " .. file .. " &"

    -- Execute the command asynchronously
    vim.fn.jobstart(cmd, {
        -- Optionally, you can set up a callback to handle when the job is done
        on_exit = function(id, code, event)
            if code == 0 then
                print("Opened " .. file .. " in Okular successfully.")
            else
                print("Failed to open " .. file .. ". Exit code: " .. code)
            end
        end,
    })
end

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
    --Mappings for vimtex
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
    -- Mappings for files
    -- ["gp"] =OpenFileInOkular()
-- vim.keymap.set('n',
      ['gp']= {':lua OpenFileInOkular()<CR>', "Open in okular"}
    -- ["gp"] =  {vim.fn.jobstart {"<cmd> !okular <cfile><CR>", {detach:1}}, "Open in okular"}
    -- ["gp"] = {vim.fn.jobstart("okular <cfile>"), "Open in okular"}
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
