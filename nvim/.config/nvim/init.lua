-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true
require("config.lazy")
require("config.keymaps")
--
-- Java Lsp Setup
-- 
-- MPR: The require('java') (nvim-java plugin) is required before the lspconfig setup below it.
-- The extra config passed in here prevent Mason from installing the default java 17 JDK and putting 
-- it on the path.
require('java').setup({
  jdk = {
    -- Install JDK using Mason.nvim
    auto_install = false,
    version = '17.0.2'
  }
})
--
-- MPR: This config tells jdtls to use my version of java installed by sdkman.
require('lspconfig').jdtls.setup({
  settings = {
    java = {
      configuration = {
        runtimes = {
          {
            name = "Java-21",
            path = "/home/martinr/.sdkman/candidates/java/current/bin/java",
            default = true,
          }
        }
      }
    }
  }
})
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
