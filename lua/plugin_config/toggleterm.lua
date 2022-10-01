local module = require('toggleterm')

module.setup {
  open_mapping = [[<c-\>]],
  start_in_insert = true,
  direction = 'tab',
  autochdir = true,
}

local Terminal = require('toggleterm.terminal').Terminal
local lazygit_terminal = Terminal:new({ cmd = 'lazygit', hidden = true })

module.toggle_lazygit = function ()
  lazygit_terminal:toggle()
end

require('keybindings').toggleterm_mapping(module)
