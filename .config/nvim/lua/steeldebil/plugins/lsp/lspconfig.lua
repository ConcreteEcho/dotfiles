return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")
    local coq = require("coq")

    local csharpconf = {
      handlers = {
        ["textDocument/definition"] = require('csharpls_extended').handler,
      },
      cmd = { "csharp-ls" }
    }

    local luaconf = {
      on_init = function(client)
        local path = client.workspace_folders[1].name
        if not vim.loop.fs_stat(path..'/.luarc.json') and not vim.loop.fs_stat(path..'/.luarc.jsonc') then
          client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
            Lua = {
              runtime = {
            -- Tell the language server which version of Lua you're using
            -- (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT'
              },
          -- Make the server aware of Neovim runtime files
              workspace = {
                checkThirdParty = false,
                library = {
                 vim.env.VIMRUNTIME
              -- "${3rd}/luv/library"
              -- "${3rd}/busted/library",
                }
            -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
            -- library = vim.api.nvim_get_runtime_file("", true)
              }
            }
          })

          client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
        end
        return true
      end
    }

    lspconfig.csharp_ls.setup(csharpconf)
    lspconfig.lua_ls.setup(luaconf)

    lspconfig.csharp_ls.setup(coq.lsp_ensure_capabilities())
    lspconfig.lua_ls.setup(coq.lsp_ensure_capabilities())
  end,
}
