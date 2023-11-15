--
-- Key mappings for nvim-dap
--
local map = vim.keymap.set

map("n", "<leader>dc", function()
  require("dap").continue()
end)

map("n", "<leader>dr", function()
  require("dap").repl.toggle()
end)

map("n", "<leader>dK", function()
  require("dap.ui.widgets").hover()
end)

map("n", "<leader>dt", function()
  require("dap").toggle_breakpoint()
end)

map("n", "<leader>dso", function()
  require("dap").step_over()
end)

map("n", "<leader>dsi", function()
  require("dap").step_into()
end)

map("n", "<leader>dl", function()
  require("dap").run_last()
end)
