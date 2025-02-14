--local colorscheme = "melange"
local colorscheme = "tokyonight"
--local colorscheme = "onedark"
--local colorscheme = "gruvbox"
vim.background=dark
vim.g.gruvbox_undercurl=1
vim.g.gruvbox_contrast_dark='medium'

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
