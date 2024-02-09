---@type ChadrcConfig 
 local M = {}
 M.ui = {theme = 'catppuccin'}
M.plugins = "custom.plugins"
M.mappings = require("custom.mappings")

function set_comment_highlight()
  vim.cmd('hi Comment guifg=#f650A9')
end

-- Call the function to set the highlight
set_comment_highlight()
 return M
