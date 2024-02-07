local plugins = {
  --   {"simrat39/rust-tools.nvim",
  -- ft = "rust",
  --     dependencies = "neovim/nvim-lspconfig",
  --     opts = function ()
  --       return "custom.configs.rust-tols"
  --
  --     end,
  -- config = function (_,opts)
  --       require("rust-tools").setup(opts)
  --
  -- end
  --
  --   },
  --   baad
  -- {  'lewis6991/spellsitter.nvim',
  --     lazy=false,
  --   config=function (_,_)
  --     require("spellsitter").setup(){
  --       enabled= true,
  --       debug= true
  --     }
  --   end
  --     
  -- },
  {
{
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    -- tag = "*",
    lazy=false,
    ft =  'norg',
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        conceallevel=2
      require("neorg").setup {
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {}, -- Adds pretty icons to your documents

          ["core.export"] = {}, -- Loads default behaviour
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/notes",
                papers = "~/phd/papers"
              },
            },
          },
        },
      }
    end,
  },
  },
  {
    "ThePrimeagen/harpoon",
    lazy = false,
    config = function(_, _)
      require "custom.configs.harpoonconf"
    end,
  },

  {
    "lervag/vimtex",
    ft = "tex",
    config = function(_, _)
      require "custom.configs.vimtexconf"
    end,
  },
  { "mbbill/undotree", opts = {}, lazy = false, config = function(_, _) end },
  {
    "tpope/vim-fugitive",
    opts = {},
    lazy = false,
    config = function(_, _) end,
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
    end,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {},
    },
  },
  {
    "mfussenegger/nvim-dap",
    config = function(_, _)
      require("core.utils").load_mappings "dap"
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "clang-format",
        "codelldb",
        "rust-analyzer",
        "luaformatter",
        "lua-language-server",
        "luau-lsp",
        "pyright",
        "mypy",
        "ruff",
        "black",
        "debugpy",
        "julia-lsp",
        "typescript-language-server",
      },
    },
  },
  {
    "simrat39/symbols-outline.nvim",
    lazy = false,
    opts = {

      vim.keymap.set({ "n", "v" }, "<leader>s", "<CMD>SymbolsOutline<CR>"),
    },
  },
}
return plugins
