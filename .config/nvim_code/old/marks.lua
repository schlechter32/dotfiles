return {
  "chentoast/marks.nvim",
  event = "VeryLazy",
  opts = {},
  keys={
    "M", "`"
  },
  config=function ()
    require("marks").setup ({
        builtin_marks = { ".", "<", ">", "^" },
    })
    
  end
}