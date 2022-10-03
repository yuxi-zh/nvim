vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

-- 向上翻页, 一次翻动10行
map('n', '<C-u>', '10k', opt)
-- 向下翻页, 一次翻动10行
map('n', '<C-d>', '10j', opt)

-- 缩进相关快捷键映射
map('v', '<', '<gv', opt)
map('v', '>', '>gv', opt)

-- 分屏相关快捷键映射

-- 分屏
map('n', 'sv', ':vsp<CR>', opt) -- 垂直分屏
map('n', 'sh', ':sp<CR>', opt) -- 水平分屏
map('n', 'sc', '<C-w>c', opt) -- 关闭其他分屏
-- 分屏比例
map('n', 's>', ':vertical resize +20<CR>', opt)
map('n', 's<', ':vertical resize -20<CR>', opt)
map("n", "s=", "<C-w>=", opt)
map("n", "sj", ":resize +10<CR>", opt)
map("n", "sk", ":resize -10<CR>", opt)
-- 分屏跳转
map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)

-- 插件相关快捷键映射

-- bufferline
local module = {}
module.bufferline_mapping = function(bufferline)
  map('n', '<C-h>', ':BufferLineCyclePrev<CR>', opt)
  map('n', '<C-l>', ':BufferLineCycleNext<CR>', opt)
end
module.cmp_mapping = function(cmp)
  return {
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<A-.>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<A-,>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close()
    }),
    ['<CR>'] = cmp.mapping.confirm({
      select = true,
      behavior = cmp.ConfirmBehavior.Replace
    }),
    ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-5), { 'i', 'c' }),
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(5), { 'i', 'c' }),
  }
end
module.nvim_tree_mapping = function(nvim_tree)
  map('n', '<C-e>', ':NvimTreeToggle<CR>', opt)
end
module.telescope_mapping = function(telescope)
  local builtin = require('telescope.builtin')
  vim.keymap.set('n', 'ff', builtin.find_files, opt)
  vim.keymap.set('n', 'fg', builtin.live_grep, opt)
  vim.keymap.set('n', 'fb', builtin.buffers, opt)
  vim.keymap.set('n', 'fh', builtin.help_tags, opt)
end
module.toggleterm_mapping = function(toggleterm)
  -- open the directory of current buffer in terminal
  vim.keymap.set('n', '<C-c>', ':TermExec cmd="cd $(dirname %p)"<CR>', opt)
  -- open lazygit under the project directory
  vim.keymap.set('n', '<C-g>', toggleterm.toggle_lazygit, opt)
end
module.lsp_mapping = function()
  vim.keymap.set('n', 'fmt', function() vim.lsp.buf.format { async = true } end, opt)
  vim.keymap.set('n', 'rn', function() vim.lsp.buf.rename() end, opt)
  -- goto
  vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opt)
  vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, opt)
  vim.keymap.set('n', 'gi', function() vim.lsp.buf.implementation() end, opt)
  vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, opt)
  vim.keymap.set('n', 'gh', function() vim.lsp.buf.hover() end, opt)
  -- diagnostics
  vim.keymap.set('n', 'go', function() vim.diagnostic.open_float() end, opt)
  vim.keymap.set('n', 'gp', function() vim.diagnostic.goto_prev() end, opt)
  vim.keymap.set('n', 'gn', function() vim.diagnostic.goto_next() end, opt)
end
module.doge_mapping = function()
  vim.g.doge_mapping = '<A-d>'
end
module.comment_mapping = function(comment)
  comment.setup {
    ---LHS of toggle mappings in NORMAL mode
    toggler = {
      ---Line-comment toggle keymap
      line = '<C-/>',
      ---Block-comment toggle keymap
      block = '<C-?>',
    },
    ---LHS of operator-pending mappings in NORMAL and VISUAL mode
    opleader = {
      ---Line-comment keymap
      line = 'gc',
      ---Block-comment keymap
      block = 'gb',
    },
    ---LHS of extra mappings
    extra = {
      ---Add comment on the line above
      above = 'gcO',
      ---Add comment on the line below
      below = 'gco',
      ---Add comment at the end of line
      eol = 'gcA',
    },
    ---Enable keybindings
    ---NOTE: If given `false` then the plugin won't create any mappings
    mappings = {
      ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
      basic = true,
      ---Extra mapping; `gco`, `gcO`, `gcA`
      extra = true,
      ---Extended mapping; `g>` `g<` `g>[count]{motion}` `g<[count]{motion}`
      extended = false,
    },
  }
end
module.dap_mapping = function(dap)
  vim.keymap.set('n', '?b', function()
    dap.toggle_breakpoint()
  end, opt)
  vim.keymap.set('n', '?C', function()
    local conditon = vim.fn.input('Beakpoint condition: ')
    dap.set_breakpoint(conditon)
  end, opt)
  vim.keymap.set('n', '?L', function()
    local messgae = vim.fn.input('Log point message: ')
    dap.set_breakpoint(nil, nil, messgae)
  end, opt)
  vim.keymap.set('n', '<F1>', function()
    dap.continue()
  end, opt)
  vim.keymap.set('n', '<F2>', function()
    dap.step_over()
  end)
  vim.keymap.set('n', '<F3>', function()
    dap.step_into()
  end, opt)
  vim.keymap.set('n', '<F4>', function()
    dap.step_out()
  end, opt)
  vim.keymap.set('n', '?dr', function()
    dap.repl.open()
  end, opt)
  vim.keymap.set('n', '?dl', function()
    dap.run_last()
  end, opt)
end
module.dapui_mapping = function()
  return {
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  }
end
return module
