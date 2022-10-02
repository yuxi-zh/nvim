local module = {}
module.setup = function (on_attach, flags, capabilities)
  require('lspconfig').jdtls.setup {
    on_attach = on_attach,
    flags = flags,
    capabilities = capabilities,
    settings = {
      jdtls = {
      }
    }
  }
end
return module
