
local my_group = vim.api.nvim_create_augroup("my_group", { clear = true }) -- Create/get the group

vim.api.nvim_create_autocmd("BufRead", {
  pattern = "*.txt",
  callback = function()
    print("Opening a text file")
  end,
  group = my_group,  -- Assign to the group
})

vim.api.nvim_create_autocmd("BufWrite", {
  pattern = "*.txt",
  callback = function()
    print("Saving a text file")
  end,
  group = my_group,  -- Assign to the group
})


-- Or, if you need to add to an existing group (without clearing):
--local my_group = vim.api.nvim_create_augroup("my_group", {}) -- Don't clear!
--
--vim.api.nvim_create_autocmd("BufEnter", {
--  pattern = "*.txt",
--  callback = function()
--    print("Entered text file")
--  end,
--  group = my_group,  -- Assign to the group
--})
