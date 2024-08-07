return {
    "jhofscheier/ltex-utils.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "nvim-telescope/telescope.nvim",
        -- "nvim-telescope/telescope-fzf-native.nvim", -- optional
    },
    opts = {
        dictionayr={
            use_vim_dict=true
        },
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    },
}
