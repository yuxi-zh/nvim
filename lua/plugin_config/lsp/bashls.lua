local module = {}
module.setup = function (on_attach, flags, capabilities)
  require('lspconfig').bashls.setup {
    on_attach = on_attach,
    flags = flags,
    capabilities = capabilities,
    settings = {
      bashls = {}
    }
  }
end
return module
