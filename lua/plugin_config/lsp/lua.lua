local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

local module = {}
module.setup = function (on_attach, flags, capabilities)
  require('lspconfig').sumneko_lua.setup {
    on_attach = on_attach,
    flags = flags,
    capabilities = capabilities,
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
          path = runtime_path,
        },
        diagnostics = {
          globals = { 'vim' },
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file('', true),
        },
        telemery = {
          enable = true,
        },
      }
    }
  }
end
return module
