-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true
require("config.lazy")
require("config.keymaps")
require("scratch")

if vim.fn.has('macunix') == 1 then
  vim.cmd [[
    nmap ` \
  ]]
end
--vim.g.neovide_scale_factor = 0.75
-- MPR: Turn off semantic highlighting as this seems to mess up Java highlighting
for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
  vim.api.nvim_set_hl(0, group, {})
end
