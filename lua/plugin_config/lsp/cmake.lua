local module = {}
module.setup = function (on_attach, flags, capabilities)
  require('lspconfig').cmake.setup {
    on_attach = on_attach,
    flags = flags,
    capabilities = capabilities,
    settings = {
      cmake = {
      }
    }
  }
end
return module
