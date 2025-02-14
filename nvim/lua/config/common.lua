--
-- common functions
--
function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
  options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
-- Terminal keymap function
function tmap(lhs, rhs, opts)
  local options = { silent = true }
  if opts then
  options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap('t', lhs, rhs, options)
end
