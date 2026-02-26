return
{

   "mbbill/undotree", 
   opts = {}, 
   lazy = false, 
   config = function(_, _) end ,
keys = {
      {
        "<leader>u",
        vim.cmd.UndotreeToggle,
        desc = "Open oil floating",
      },
    },
}