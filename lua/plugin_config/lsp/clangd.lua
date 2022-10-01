local module = {}
module.setup = function (on_attach, flags, capabilities)
  require('lspconfig').clangd.setup {
    on_attach = on_attach,
    flags = flags,
    capabilities = capabilities,
    settings = {
      clangd = {
        filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto', 'cu', 'cc', 'h', 'hpp' }
      }
    }
  }
end
return module
