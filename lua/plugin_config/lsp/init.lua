local lsp_installer = require('nvim-lsp-installer')

-- luanguage sevrer need install
local servers = {
  sumneko_lua = require('plugin_config.lsp.lua'),
  clangd = require('plugin_config.lsp.clangd'),
  pylsp = require('plugin_config.lsp.pylsp'),
  cmake = require('plugin_config.lsp.cmake'),
  jdtls = require('plugin_config.lsp.jdtls'),
  bashls = require('plugin_config.lsp.bashls'),
  marksman = require('plugin_config.lsp.marksman')
}

local on_ATtach = function(client, buffer)
  local opts = { noremap = true, silent = true, buffer = buffer }
  vim.keymap.set('n', '<space>gd', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', '<space>gD', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', '<space>ho', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
end
local flags = { debounce_text_change = 100 }
local cmp = require('cmp_nvim_lsp')
local capabilities = cmp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- install language server automatically
for name, module in pairs(servers) do
  local found, server = lsp_installer.get_server(name)
  if found then
    if not server:is_installed() then
      print('Installing ' .. name)
      server:install()
    end
  end
  module.setup(on_attach, flags, capabilities)
end

-- require('plugin_config.lsp.lua').setup(on_attach, flags, capabilities)
-- require('plugin_config.lsp.clangd').setup(on_attach, flags, capabilities)
-- require('plugin_config.lsp.pylsp').setup(on_attach, flags, capabilities)
-- require('plugin_config.lsp.clangd').setup(on_attach, flags, capabilities)
-- require('plugin_config.lsp.cmake').setup(on_attach, flags, capabilities)
-- require('plugin_config.lsp.jdtls').setup(on_attach, flags, capabilities)
-- require('plugin_config.lsp.bashls').setup(on_attach, flags, capabilities)

require('keybindings').lsp_mapping()
