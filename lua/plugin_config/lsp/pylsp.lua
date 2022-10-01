local module = {}
module.setup = function (on_attach, flags, capabilities)
  require('lspconfig').pylsp.setup {
    on_attach = on_attach,
    flags = flags,
    capabilities = capabilities,
    settings = {
      pylsp = {
        plugins = {
          pycodestyle = {
            ignore = {'W391'},
            maxLineLength = 100
          }
        }
      }
    }
  }
end
return module
