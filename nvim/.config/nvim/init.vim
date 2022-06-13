" vim:fdm=marker
"                                                
"                                                
"██╗███╗   ██╗██╗████████╗██╗   ██╗██╗███╗   ███╗
"██║████╗  ██║██║╚══██╔══╝██║   ██║██║████╗ ████║
"██║██╔██╗ ██║██║   ██║   ██║   ██║██║██╔████╔██║
"██║██║╚██╗██║██║   ██║   ╚██╗ ██╔╝██║██║╚██╔╝██║
"██║██║ ╚████║██║   ██║██╗ ╚████╔╝ ██║██║ ╚═╝ ██║
"╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
"
" Note: This init will only work with neovim >= 0.7
"
" https://github.com/martinprobson/dotfiles/tree/master/nvim/.config/nvim
" {{{GENERAL
"
syntax enable					" Syntax highlighting
set belloff=all					" Turn off sounds
set hidden					" Allow buffer switching without saving first
inoremap jj <ESC>				" Map jj to Esc
tnoremap <Esc> <C-\><C-n>			" Map Esc/jj in terminal mode
tnoremap jj <C-\><C-n>
set number relativenumber			" Vim absolute and relative line numbers
set noshowmode					" Do not show mode on last line (airline does this on status line)
set hlsearch					" highlight all search matches
set wildmenu					" enhanced command line completion 
set path+=**
set showmatch				        " show matched brackets
set modeline
set ignorecase smartcase
if (has("termguicolors"))
	set termguicolors
endif
autocmd BufNewFile,BufRead *.scala set path+=**
" }}}
" {{{plugins
"
" Plugins
"
call plug#begin(stdpath('data') . '/plugged')
" colour scheme
Plug 'https://github.com/morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
" Status line 
"
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'GEverding/vim-hocon'
" Markdown support
Plug 'https://github.com/suan/vim-instant-markdown.git'
" vimwiki 
Plug 'vimwiki/vimwiki'
Plug 'sheerun/vim-polyglot'
Plug 'https://github.com/edkolev/tmuxline.vim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'mhinz/vim-signify'
Plug 'junegunn/fzf' , { 'do' : { -> fzf#install () } }
Plug 'junegunn/fzf.vim'
Plug 'liuchengxu/vim-which-key'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-fugitive'
Plug 'caenrique/nvim-toggle-terminal'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*'}
Plug 'neovim/nvim-lspconfig'
Plug 'scalameta/nvim-metals'
Plug 'hrsh7th/nvim-compe'
Plug 'nvim-treesitter/nvim-treesitter',{ 'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
call plug#end()
" }}}
" {{{ToggleTerminal
nnoremap <silent><leader>t :ToggleTerminal<CR>
tnoremap <silent> <leader>t <C-\><C-n>:ToggleTerminal<CR>
" }}}
" {{{bufferline
nnoremap <silent>L :BufferLineCycleNext<CR>
nnoremap <silent>H :BufferLineCyclePrev<CR>
lua << EOF
require("bufferline").setup{ options = {
			offsets = {{filetype = "NvimTree", text = "File Explorer" , text_align = "left" }}
		}
}
EOF
" }}}
" {{{fzf.vim
nnoremap <silent><leader>e :<c-u>FZF<CR>
nnoremap <silent><leader>eh :<c-u>FZF ~<CR>
nnoremap <silent><leader>b :<c-u>Buffers<CR>
nnoremap <silent><leader>g :<c-u>GFiles<CR>
nnoremap <silent><leader>h :<c-u>History<CR>
" }}}
" {{{vim-signify
" Default updatetime of 4000ms is not good for async update
set updatetime=100
nnoremap <silent> <leader>st :SignifyToggleHighlight<CR>
nnoremap <silent> <leader>sd :SignifyHunkDiff<CR>
" }}}
" {{{nvim-tree
lua << EOF
require("nvim-tree").setup{}
EOF
nnoremap <silent> <leader>f :NvimTreeToggle<CR>
nnoremap <silent> <leader>n :NvimTreeFindFile<CR>
" }}}
" {{{COLOURS/STATUS LINE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLOUR SCHEME/STATUS LINE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
let g:gruvbox_undercurl=1
let g:gruvbox_contrast_dark='medium'
"let g:airline_theme='gruvbox'
let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1
colorscheme onedark
" }}}
" {{{VIMWIKI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIMWIKI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For vimwiki to use markdown syntax
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown' }
let g:vimwiki_list = [{'path' : '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_listsyms = '✗○◐●✓'
" }}}
" {{{WhichKey
nnoremap <silent> <leader>      :<c-u>WhichKey '\'<CR>
let g:which_key_map  = {}
" Signify
let g:which_key_map['s'] = { 'name' : 'signify' }
let g:which_key_map.s.t = ['SignifyToggleHighlight', 'SignifyToggleHighlight' ]
let g:which_key_map.s.d = ['SignifyHunkDiff', 'SignifyHunkDiff' ]
" vimwiki
let g:which_key_map['w'] = { 'name' : 'VimWiki' }
" Markdown preview
let g:which_key_map['m'] = { 'name' : 'Markdown preview' }
let g:which_key_map.s.t = ['Markdown Preview', 'Markdown Preview' ]
call which_key#register('\', "g:which_key_map")
" }}}
" {{{Markdown Preview
" Instant markdown preview
let g:instant_markdown_autostart = 0
map <leader>md :InstantMarkdownPreview
" }}}
" {{{Language server config
"
" Language server config
"
augroup lsp
au!
au FileType scala,sbt lua require('metals').initialize_or_attach({})
"au FileType haskell require'lspconfig'.hls.setup{}
augroup end
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
" Does not work
"nnoremap <silent> gD 		<cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
" Does not work
" nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
autocmd Filetype scala setlocal omnifunc=v:lua.vim.lsp.omnifunc
autocmd BufWritePre *.scala lua vim.lsp.buf.formatting_sync(nil, 100)
"
"
" Haskell Language Server setup
lua << EOF
require'lspconfig'.hls.setup{}
EOF
"
" Do not show diagnostics, just use underlines and use CTRL-P/CTRL-N to show
" the virtual text.
"
lua << EOF
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, { 
		underline = true,
		virtual_text = false,
		signs = true,
		update_in_insert = true, 
		}
	)
EOF

:lua << EOF
  metals_config = require'metals'.bare_config()
  metals_config.settings = {
     showImplicitArguments = true,
     excludedPackages = {
       "akka.actor.typed.javadsl",
       "com.github.swagger.akka.javadsl"
     }
  }

  metals_config.on_attach = function()
    require'completion'.on_attach();
  end

EOF
:lua << EOF
vim.o.completeopt = "menuone,noselect"

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = false;

  source = {
    path = true;
    buffer = true;
    calc = true;
    vsnip = false;
    nvim_lsp = true;
    nvim_lua = true;
    spell = true;
    tags = true;
    snippets_nvim = false;
    treesitter = true;
  };
}
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
--  elseif vim.fn.call("vsnip#available", {1}) == 1 then
--    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    -- If <S-Tab> is not working in your terminal, change it to <C-h>
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
EOF
let g:diagnostic_enable_virtual_text = 0
nnoremap <silent> [c          :NextDiagnostic<CR>
nnoremap <silent> ]c          :PrevDiagnostic<CR>
nnoremap <silent> go          :OpenDiagnostic<CR>
" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
" Avoid showing message extra message when using completion
set shortmess+=c
" Set maxmimum number of signs to show in signcolumn
set signcolumn=auto:5
" }}}
" {{{Treesitter config
"
" Treesitter config
"
:lua << EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
    disable = {},
  },
  ensure_installed = {
    "scala",
		"java",
		"vim",
		"lua",
		"json",
		"dockerfile",
		"haskell",
		"bash"
  },
}
EOF
" }}}
