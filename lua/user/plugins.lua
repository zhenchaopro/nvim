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
  snapshot = '1007',
  snapshot_path = require("packer.util").join_paths(vim.fn.stdpath('config'), 'snapshots'), -- Default save directory for snapshots
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
	use("numToStr/Comment.nvim") -- Easily comment stuff
	use("kyazdani42/nvim-web-devicons")
	use({
		"kyazdani42/nvim-tree.lua",
		config = function()
			require("nvim-tree").setup({
				view = {
					mappings = {
						list = {
							{ key = { "<CR>", "o", "<1-LeftMouse>" }, action = "edit_no_picker" },
							{ key = { "O" }, action = "edit" },
							{ key = { "<2-RightMouse>", "<C-]>" }, action = "cd" },
							{ key = "<C-v>", action = "vsplit" },
							{ key = "<C-x>", action = "split" },
							{ key = "<C-t>", action = "tabnew" },
							{ key = "<", action = "prev_sibling" },
							{ key = ">", action = "next_sibling" },
							{ key = "P", action = "parent_node" },
							{ key = "<BS>", action = "close_node" },
							{ key = "<Tab>", action = "preview" },
							{ key = "K", action = "first_sibling" },
							{ key = "J", action = "last_sibling" },
							{ key = "I", action = "toggle_ignored" },
							{ key = "H", action = "toggle_dotfiles" },
							{ key = "R", action = "refresh" },
							{ key = "a", action = "create" },
							{ key = "d", action = "remove" },
							{ key = "D", action = "trash" },
							{ key = "r", action = "rename" },
							{ key = "<C-r>", action = "full_rename" },
							{ key = "x", action = "cut" },
							{ key = "c", action = "copy" },
							{ key = "p", action = "paste" },
							{ key = "y", action = "copy_name" },
							{ key = "Y", action = "copy_path" },
							{ key = "gy", action = "copy_absolute_path" },
							{ key = "[c", action = "prev_git_item" },
							{ key = "]c", action = "next_git_item" },
							{ key = "-", action = "dir_up" },
							{ key = "s", action = "system_open" },
							{ key = "q", action = "close" },
							{ key = "g?", action = "toggle_help" },
						},
					},
				},
			})
		end,
	})
	use("akinsho/bufferline.nvim")
	use("moll/vim-bbye")
	use("nvim-lualine/lualine.nvim")
	use("akinsho/toggleterm.nvim")
	use("ahmedkhalf/project.nvim")
	use("lewis6991/impatient.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use("goolord/alpha-nvim")
	use("folke/which-key.nvim")

	use({
		"phaazon/hop.nvim",
		as = "hop",
		branch = "v1", -- optional but strongly recommended
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require("hop").setup({ keys = "etovxqpdgfblzhckisuran" })
		end,
	})

	-- Colorschemes
	-- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
	use("tomasr/molokai")
	use("lunarvim/darkplus.nvim")
	use("EdenEast/nightfox.nvim")
	-- use("ellisonleao/gruvbox.nvim")
	use("morhetz/gruvbox")
	use("dracula/vim")

	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")
	use("onsails/lspkind-nvim")

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/nvim-lsp-installer") -- simple to use language server installer
	use("tamago324/nlsp-settings.nvim") -- language server settings defined in json for
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters

	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		commit = "559f2e7568f04872004fb793889e0cf55249abe4",
	})
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- Git
	use("lewis6991/gitsigns.nvim")

	-- tag list
	use("liuchengxu/vista.vim")

	use("tpope/vim-fugitive")

	use("mattn/emmet-vim")

	use("preservim/vimux")
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "make",
		config = function()
			require("telescope").load_extension("fzf")
		end,
	})

	use({
		"nvim-telescope/telescope-file-browser.nvim",
		config = function()
			require("telescope").load_extension("file_browser")
		end,
	})

	-- Cursorhold fix
	use({
		"antoinemadec/FixCursorHold.nvim",
		event = "BufRead",
		config = function()
			vim.g.cursorhold_updatetime = 100
		end,
	})

	-- Smooth scrolling
	use({
		"karb94/neoscroll.nvim",
		event = "BufRead",
		-- config = function()
		-- 	require("configs.neoscroll").config()
		-- end,
		-- disable = not config.enabled.neoscroll,
	})

	use("stefandtw/quickfix-reflector.vim")
	use("simrat39/symbols-outline.nvim")

	use({ "mhanberg/elixir.nvim", requires = { "neovim/nvim-lspconfig", "nvim-lua/plenary.nvim" } })

	use({
		"stevearc/aerial.nvim",
		config = function()
			require("telescope").load_extension("aerial")
			require("aerial").setup({
				backends = { "treesitter", "lsp", "markdown" },
				filter_kind = {
					"Class",
					"Constructor",
					"Enum",
					"Function",
					"Interface",
					"Module",
					"Method",
					"Struct",
				},

				on_attach = function(bufnr)
					vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>a", "<cmd>AerialToggle!<CR>", {})
				end,
			})
		end,
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
