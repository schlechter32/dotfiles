local base = require "plugins.configs.lspconfig"
local on_attach = base.on_attach
local capabilities = base.capabilities
local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

lspconfig.clangd.setup {

  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}
lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetype = { "rust" },
  root_dir = util.root_pattern "Cargo.toml",
  settings = {
    ["rust_analyzer"] = {
      cargo = {
        allFeatures = true,
      },
    },
  },
}
lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
}
lspconfig.julials.setup {
  on_new_config = function(new_config, _)
    local julia = vim.fn.expand "~/.julia/environments/nvim-lspconfig/bin/julia"
    if lspconfig.util.path.is_file(julia) then
      vim.notify "Hello!"
      new_config.cmd[1] = julia
    end
  end,
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "julia" },
  root_dir = function(fname)
    return util.root_pattern "Project.toml"(fname) or util.find_git_ancestor(fname)
  end,
  single_file_support = true,
}
local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = {vim.api.nvim_buf_get_name(0)},
  }
  vim.lsp.buf.execute_command(params)
end

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    preferences = {
      disableSuggestions = true,
    }
  },
  commands = {
    OrganizeImports = {
      organize_imports,
      description = "Organize Imports",
    }
  }
}
-- lspconfig.efm.setup({
--   init_options = {documentFormatting = true},
--   filetypes = {"lua"},
--   setting ={
--     languages = {
--       lua = {
--         formatCommand = "lua-format -i --no-keep-simple-function-one-line --no-break-after-operator --column-limit=150 --break-after-table-lb",
--                     formatStdin = true
--       }
--     }
--   }
-- )
