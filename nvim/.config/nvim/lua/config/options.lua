local options = {
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  mouse="a",
  completeopt = { "menu","menuone", "noselect" }, -- mostly just for cmp
  modeline = true,                         -- Allow use of modelines
	hlsearch = true,												 -- highlight all search results (TODO might switch this off as can be annoying)
	wildmenu = true, 												 -- Enhanced command line completion (TODO is this required now that we have cmp?)
  ignorecase = true,                       -- Ignorecase in search (see also smartcase below)
  smartcase = true,                        -- Override ignorecase if search patten contains uppercase
  showmatch = true,                        -- Show matched brackets
  number = true,                           -- set numbered lines
  hidden = true,                           -- Allow buffer switching without saving first
  belloff = all,                           -- Turn off all sounds
  relativenumber = true,                   -- set relative numbered lines
  fileencoding = "utf-8",                  -- the encoding written to a file
  smartindent = true,                      -- make indenting smarter again
  timeoutlen = 500,                        -- time to wait for a mapped sequence to complete (in milliseconds)
  updatetime = 300,                        -- faster completion (4000ms default)
  undofile = true,                         -- enable persistent undo
  expandtab = true,                        -- convert tabs to spaces
  cursorline = true,                       -- highlight the current line
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  guifont = "monospace:h17",               -- the font used in graphical neovim applications
  numberwidth = 4,                         -- set number column width to 2 {default 4}
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  cmdheight = 1,                           -- more space in the neovim command line for displaying messages
  autochdir = true                         -- Change directory to the current file
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

map('i','jj','<ESC>')                     -- Map jj to Esc
tmap('<ESC>','<C-\\><C-n>')               -- Map Esc/jj in terminal mode
tmap('jj','<C-\\><C-n>')                  -- Map Esc/jj in terminal mode
