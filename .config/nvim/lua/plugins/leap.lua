return {
  "ggandor/leap.nvim",
  lazy = false,
  case_sensitive = false,
  safe_labels = {}, -- disable auto-jumping to the first match; doesn't work on one unique target
  max_phase_one_targets = 0, -- first char won't show possible matches
  max_highlighted_traversal_targets = 10,
  -- set_default_kemaps = false,

  config = function(_, _)
    local leap = require "leap"
    -- leap.set_default_keymaps(false)
    -- leap.setup(opts)
    -- require("leap.user").set_repeat_keys("<enter>", "<backspace>")

    -- Bidirectional search
    vim.keymap.set("n", "<leader>s", function()
      leap.leap { target_windows = { vim.api.nvim_get_current_win() } }
    end)
    -- vim.keymap.set("x", "f", function()
    --   leap.leap({ target_windows = { vim.api.nvim_get_current_win() } })
    -- end)

    -- mark cursor location before jumping
    vim.api.nvim_create_autocmd("User", {
      pattern = "LeapEnter",
      callback = function()
        vim.cmd "normal m'"
      end,
    })
    -- center cursor after jumping
    vim.api.nvim_create_autocmd("User", {
      pattern = "LeapLeave",
      callback = function()
        vim.cmd "normal zz"
      end,
    })
  end,
}
