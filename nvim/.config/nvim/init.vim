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
set mouse=                  " Disable mouse
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
Plug 'nvim-lua/plenary.nvim'
Plug 'liuchengxu/vim-which-key'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-fugitive'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*'}
Plug 'neovim/nvim-lspconfig'
Plug 'scalameta/nvim-metals'
Plug 'nvim-treesitter/nvim-treesitter',{ 'do': ':TSUpdate'}
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
call plug#end()
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
require("nvim-tree").setup{
	view = {
		adaptive_size = true,
		side = "left"},
		}
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
:lua << EOF
  metals_config = require'metals'.bare_config()
  metals_config.init_options.statusBarProvider = "on"
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
augroup lsp
au!
au FileType scala,sbt lua require('metals').initialize_or_attach({metals_config})
au FileType haskell require'lspconfig'.hls.setup{}
augroup end
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
"nnoremap <silent> gD 		<cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
" SHow the full worksheet output
"nnoremap <silent> K     <cmd>lua require("metals").hover_worksheet()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> T     <cmd>lua require("metals.tvp").toggle_tree_view()<CR>
" Does not work
" nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.diagnostic.goto_next()<CR>
autocmd Filetype scala setlocal omnifunc=v:lua.vim.lsp.omnifunc
autocmd BufWritePre *.scala lua vim.lsp.buf.format(nil, 100)
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
" }}}
" {{{cmp Setup
"
" cmp setup (completion)
"
set completeopt=menu,menuone,noselect

lua <<EOF
  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },
    window = {
      --completion = cmp.config.window.bordered(),
      --documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Set up lspconfig.
--  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  --require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
  require('lspconfig')['hls'].setup {
    capabilities = capabilities
  }
EOF
let g:diagnostic_enable_virtual_text = 1
nnoremap <silent> [c          :NextDiagnostic<CR>
nnoremap <silent> ]c          :PrevDiagnostic<CR>
nnoremap <silent> go          :OpenDiagnostic<CR>
" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
" Avoid showing message extra message when using completion
set shortmess+=c
set shortmess-=F
" Set maxmimum number of signs to show in signcolumn
set signcolumn=auto:3
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
