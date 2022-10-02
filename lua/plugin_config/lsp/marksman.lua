local module = {}
module.setup = function (on_attach, flags, capabilities)
  require('lspconfig').marksman.setup {
    on_attach = on_attach,
    flags = flags,
    capabilities = capabilities,
    settings = {
      marksman = {},
    }
  }
end
return module
