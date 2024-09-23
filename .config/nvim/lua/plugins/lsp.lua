return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost" },
    cmd = { "LspInfo", "LspInstall", "LspUninstall", "Mason" },
    dependencies = {
      -- Plugin(s) and UI to automatically install LSPs to stdpath
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",

      -- Install lsp autocompletions
      "hrsh7th/cmp-nvim-lsp",

      -- Progress/Status update for LSP
      { "j-hui/fidget.nvim", opts = {} },
    },
    config = function()
      local map_lsp_keybinds = require("user.keymaps").map_lsp_keybinds -- Has to load keymaps before pluginslsp

      -- Override tsserver diagnostics to filter out specific messages
      local messages_to_filter = {
        "This may be converted to an async function.",
      }

      local function tsserver_on_publish_diagnostics_override(_, result, ctx, config)
        local filtered_diagnostics = {}

        for _, diagnostic in ipairs(result.diagnostics) do
          local found = false
          for _, message in ipairs(messages_to_filter) do
            if diagnostic.message == message then
              found = true
              break
            end
          end
          if not found then
            table.insert(filtered_diagnostics, diagnostic)
          end
        end

        result.diagnostics = filtered_diagnostics

        vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
      end

      -- Default handlers for LSP
      local default_handlers = {
        ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
        ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
      }

      -- Function to run when neovim connects to a Lsp client
      ---@diagnostic disable-next-line: unused-local
      local on_attach = function(_client, buffer_number)
        -- Pass the current buffer to map lsp keybinds
        map_lsp_keybinds(buffer_number)
      end

      -- LSP servers and clients are able to communicate to each other what features they support.
      --  By default, Neovim doesn't support everything that is in the LSP Specification.
      --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
      --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

      -- LSP servers to install (see list here: https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers )
      --  Add any additional override configuration in the following tables. Available keys are:
      --  - cmd (table): Override the default command used to start the server
      --  - filetypes (table): Override the default list of associated filetypes for the server
      --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
      --  - settings (table): Override the default settings passed when initializing the server.
      --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
      local servers = {
        -- LSP Servers
        bashls = {},
        biome = {},
        cssls = {},

        julials = {},
        -- gleam = {},
        eslint = {
          autostart = false,
          cmd = { "vscode-eslint-language-server", "--stdio", "--max-old-space-size=12288" },
          settings = {
            format = false,
          },
        },
        html = {},
        jsonls = {},
        -- texlab = {
        --         latexFormatter = "latexindent",
        --         latexindent = {
        --             modifyLineBreaks = true,
        --             -- local = "lindent.yamls"
        --         },
        -- },
        texlab = {
          settings = {
            texlab = {
              auxDirectory = ".",
              bibtexFormatter = "texlab",
              build = {
                args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
                executable = "latexmk",
                forwardSearchAfter = true,
                onSave = true,
              },
              chktex = {
                onEdit = false,
                onOpenAndSave = false,
              },
              diagnosticsDelay = 300,
              formatterLineLength = 80,
              forwardSearch = {
                executable = "displayline",
                args = { "-g", "%l", "%p", "%f" },
                -- Enable back search on Skim -> Preference -> Sync:
                --   Preset: Custom
                --   Command: /Users/simo/go/bin/nvim-texlabconfig
                --   Arguments: -file '%file' -line %line -cache_root /Users/simo/.cache/lvim
                -- (Commands and Arguments accept only full path, change '/User/simo')

                -- executable = 'sioyek',
                -- args = {
                --     '--reuse-window',
                --     '--execute-command', 'toggle_synctex', -- Open Sioyek in synctex mode.
                --     '--inverse-search',
                --     [[nvim-texlabconfig -file %%%1 -line %%%2 -server ]] .. vim.v.servername,
                --     '--forward-search-file', '%f',
                --     '--forward-search-line', '%l', '%p'
                -- }
              },
              latexFormatter = "latexindent",
              latexindent = {
                modifyLineBreaks = true,
              },
            },
          },
        },
        lua_ls = {
          settings = {
            Lua = {
              runtime = { version = "LuaJIT" },
              telemery = { enable = false },
              workspace = {
                checkThirdParty = false,
                -- Tells lua_ls where to find all the Lua files that you have loaded
                -- for your neovim configuration.
                library = {
                  "${3rd}/luv/library",
                  unpack(vim.api.nvim_get_runtime_file("", true)),
                },
              },
              telemetry = { enabled = false },
            },
          },
        },
        marksman = {},
        ocamllsp = {
          settings = {
            inlayHints = true,
          },
        },
        -- nil_ls = {},
        pyright = {},
        sqlls = {},
        tailwindcss = {},
        tsserver = {
          settings = {
            maxTsServerMemory = 12288,
            typescript = {
              inlayHints = {
                includeInlayEnumMemberValueHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayVariableTypeHintsWhenTypeMatchesName = true,
              },
            },
            javascript = {
              inlayHints = {
                includeInlayEnumMemberValueHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayVariableTypeHintsWhenTypeMatchesName = true,
              },
            },
          },
          handlers = {
            ["textDocument/publishDiagnostics"] = vim.lsp.with(tsserver_on_publish_diagnostics_override, {}),
          },
        },
        yamlls = {},
        svelte = {},
        ltex = {
          filetypes = {
            "gitcommit",
            "markdown",
            "org",
            -- "plaintex",
            "rst",
            "rnoweb",
            "tex",
            "pandoc",
            "quarto",
            "rmd",
            "context",
            "html",
            "xhtml",
            "mail",
            "text",
          },
        },
        rust_analyzer = {
          check = {
            command = "clippy",
          },
        },
      }

      local formatters = {
        prettierd = {},
        stylua = {},
        black = {},
      }

      local manually_installed_servers = { "ocamllsp", "gleam", "rust_analyzer" }

      local mason_tools_to_install = vim.tbl_keys(vim.tbl_deep_extend("force", {}, servers, formatters))

      local ensure_installed = vim.tbl_filter(function(name)
        return not vim.tbl_contains(manually_installed_servers, name)
      end, mason_tools_to_install)

      require("mason-tool-installer").setup {
        auto_update = true,
        run_on_start = true,
        start_delay = 3000,
        debounce_hours = 12,
        ensure_installed = ensure_installed,
      }

      -- Iterate over our servers and set them up
      for name, config in pairs(servers) do
        require("lspconfig")[name].setup {
          autostart = config.autostart,
          cmd = config.cmd,
          capabilities = capabilities,
          filetypes = config.filetypes,
          handlers = vim.tbl_deep_extend("force", {}, default_handlers, config.handlers or {}),
          on_attach = on_attach,
          settings = config.settings,
          root_dir = config.root_dir,
        }
      end

      -- require("lspconfig").ltex.setup({
      --         capabilities=capabilities,
      --         on_attach=function(client,bufnr)
      --                 require("ltex-utils").on_attach(bufnr)
      --             end,
      --       settings = {
      --         ltex = {
      --           language = "de-DE",
      --         },
      --       }
      --         })
      -- Special child texlabconfig
      --
      -- local executable = "displayline"
      -- local args = { "%l", "%p", "%f" }
      -- require("lspconfig").texlab.setup({
      --
      --     autostart = texlab.autostart,
      --     cmd = texlab.cmd,
      --     capabilities = capabilities,
      --     filetypes = texlab.filetypes,
      --     handlers = vim.tbl_deep_extend("force", {}, default_handlers, texlab.handlers or {}),
      --     on_attach = on_attach,
      --     -- settings = config.settings,
      --     root_dir = texlab.root_dir,
      --     setting = {
      --         texlab = {
      --             forwardSearch = {
      --                 executable = executable,
      --                 args = args,
      --             },
      --         },
      --     },
      -- })

      -- Setup mason so it can manage 3rd party LSP servers
      require("mason").setup {
        ui = {
          border = "rounded",
        },
      }

      require("mason-lspconfig").setup()

      -- Configure borderd for LspInfo ui
      require("lspconfig.ui.windows").default_options.border = "rounded"

      -- Configure diagnostics border
      vim.diagnostic.config {
        float = {
          border = "rounded",
        },
      }
    end,
  },
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
      notify_on_error = false,
      -- format_after_save = {
      --   async = true,
      --   timeout_ms = 500,
      --   lsp_fallback = true,
      -- },
      formatters_by_ft = {
        javascript = { { "prettierd", "prettier", "biome" } },
        typescript = { { "prettierd", "prettier", "biome" } },
        typescriptreact = { { "prettierd", "prettier", "biome" } },
        svelte = { { "prettierd", "prettier " } },
        lua = { "stylua" },
        -- julia = { "julials" },
        python = { "autopep8", "black" },
        latex = { "latexindent" },
      },
    },
  },
}
