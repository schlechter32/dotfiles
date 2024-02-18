return {
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  -- tag = "*",
  lazy = false,
  ft = "norg",
  dependencies = { "nvim-lua/plenary.nvim" },
  conceallevel = 2,
  config = function()
    require("neorg").setup {
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.summary"] = {}, -- Generate summaryGenerate summary)
        -- can be enabled when nvim v10 is used
        -- ["core.temputempus"] = {}, -- Generate summaryGenerate summary)
        -- ["core.ui.calendar"] = {},-- Show calendar

        ["core.export"] = {}, -- Loads default behaviour
        ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              secondBrain = "~/source/secondBrain/",
              -- areas = "~/phd/papers",
              -- reso = "~/know",
            },
          },
        },
      },
    }
  end,
}
