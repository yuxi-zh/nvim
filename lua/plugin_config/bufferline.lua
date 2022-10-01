local bufferline = require('bufferline')
bufferline.setup {
  options = {
    -- 使用内置的language server
    diagnostics = 'nvim_lsp',
    offsets = {{
      filetype = 'NvimTree',
      text = 'File Explore',
      highlight = 'Directory',
      text_align = 'left'
    }}
  }
}
require('keybindings').bufferline_mapping(bufferline)
