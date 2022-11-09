local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)

  use { 'wbthomason/packer.nvim' } -- Have packer manage itself
	-- Colourschemes
	use { 'morhetz/gruvbox' }
	use { 'joshdick/onedark.vim' }
  use { "folke/tokyonight.nvim"}
  use { "lunarvim/darkplus.nvim"}

	-- Status line
	use { 'nvim-lualine/lualine.nvim' }

	-- vimwiki
	use { 'vimwiki/vimwiki' }
	--
	-- FZF
	use { 'junegunn/fzf' , run = ':call fzf#install ()' }
	use { 'junegunn/fzf.vim' }

	-- polyglot
 	use { 'sheerun/vim-polyglot' }
	
	use { 'edkolev/tmuxline.vim', run = ':Tmuxline vim_statusline_2'  }
	use { 'kyazdani42/nvim-tree.lua' }
	use { 'nvim-lua/plenary.nvim' }
	use { 'mhinz/vim-startify' }
	--
	-- git
	use { 'tpope/vim-fugitive' }
	use { 'lewis6991/gitsigns.nvim' }

	use { 'kyazdani42/nvim-web-devicons' }
	use { 'akinsho/bufferline.nvim' }

	-- LSP 
  use { 'neovim/nvim-lspconfig' }
  use { 'scalameta/nvim-metals' }

	-- Treesitter
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

	-- cmp
	use { 'hrsh7th/cmp-nvim-lsp' }
	use { 'hrsh7th/cmp-buffer' }
	use { 'hrsh7th/cmp-path' }
	use { 'hrsh7th/cmp-cmdline' }
	use { 'hrsh7th/nvim-cmp' }

	-- vsnip
	use { 'hrsh7th/cmp-vsnip' }
	use { 'hrsh7th/vim-vsnip' }


	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)