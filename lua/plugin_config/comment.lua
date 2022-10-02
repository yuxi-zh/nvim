local comment = require('Comment')
comment.setup {
  ---Add a space b/w comment and the line
  padding = true,
  ---Whether the cursor should stay at its position
  sticky = true,
  ---Lines to be ignored while (un)comment
  ignore = nil,
  ---Function to call before (un)comment
  pre_hook = nil,
  ---Function to call after (un)comment
  post_hook = nil,
}
require('keybindings').comment_mapping(comment)
