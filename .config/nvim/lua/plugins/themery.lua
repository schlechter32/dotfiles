return {
    'zaldih/themery.nvim',
    dependencies={ "folke/tokyonight.nvim","scottmckendry/cyberdream.nvim"},
    config = function()
        -- Minimal config
        require("themery").setup({
            themes = { "catppuccin-mocha", "catppuccin-latte","rose-pine-moon", "rose-pine-dawn","tokyonight-night","tokyonight-storm","tokyonight-day", "tokyonight-moon","cyberdream"}, -- Your list of installed colorschemes.
            livePreview = true,     -- Apply theme while picking. Default to true.
        })
    end
}
-- return {}
