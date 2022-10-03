local dapui = require("dapui")
dapui.setup({
  icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
  --[[   mappings = {
    -- use a table to apply multiple mappings
    expand = { "<cr>", "<2-leftmouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  }, ]]
  mappings = require('keybindings').dapui_mapping(dapui),
  -- expand lines larger than the window
  -- requires >= 0.7
  expand_lines = vim.fn.has("nvim-0.7"),
  -- layouts define sections of the screen to place windows.
  -- the position can be "left", "right", "top" or "bottom".
  -- the size specifies the height/width depending on position. it can be an int
  -- or a float. integer specifies height/width directly (i.e. 20 lines/columns) while
  -- float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
  -- elements are the elements shown in the layout (in order).
  -- layouts are opened in order so that earlier layouts take priority in window sizing.
  layouts = {
    {
      elements = {
        -- elements can be strings or table with id and size keys.
        { id = "scopes", size = 0.25 },
        "breakpoints",
        "stacks",
        "watches",
      },
      size = 40, -- 40 columns
      position = "left",
    },
    {
      elements = {
        "repl",
        "console",
      },
      size = 0.25, -- 25% of total lines
      position = "bottom",
    },
  },
  controls = {
    -- requires neovim nightly (or 0.8 when released)
    enabled = true,
    -- display controls in this element
    element = "repl",
    icons = {
      pause = "",
      play = "",
      step_into = "",
      step_over = "",
      step_out = "",
      step_back = "",
      run_last = "↻",
      terminate = "□",
    },
  },
  floating = {
    max_height = nil, -- these can be integers or a float between 0 and 1.
    max_width = nil, -- floats will be treated as percentage of your screen.
    border = "single", -- border style. can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil, -- can be integer or nil.
    max_value_lines = 100, -- can be integer or nil.
  }
})
local dap = require("dap")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
