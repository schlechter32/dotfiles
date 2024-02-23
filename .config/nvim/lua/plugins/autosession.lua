return {

  "rmagatti/auto-session",
  -- lazy = false,
  config = function()
    require("auto-session").setup {
      -- auto_session_enable_last_session = true,
      auto_restore_enabled = true,
      auto_session_create_enabled = true,
      log_level = "error",
      -- auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      session_lens = {
        -- If load_on_setup is set to false, one needs to eventually call `require("auto-session").setup_session_lens()` if they want to use session-lens.
        buftypes_to_ignore = {}, -- list of buffer types what should not be deleted from current session
        load_on_setup = true,
        theme_conf = { border = true },
        previewer = false,
      },
      auto_save_enabled = true,
      -- auto_session_enable_last_session = true,

      -- Set mapping for searching a session.
      -- ⚠️ This will only work if Telescope.nvim is installed
      vim.keymap.set("n", "<leader>ls", require("auto-session.session-lens").search_session, {
        noremap = true,
      }),
    }
  end,
}
