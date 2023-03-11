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

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  --[[ use "folke/neodev.nvim" ]]

  -- git interation
  use 'lewis6991/gitsigns.nvim'

  -- undo tree
  use('mbbill/undotree')

  -- status line
  use("nvim-lualine/lualine.nvim")
  -- which key
  use("folke/which-key.nvim")
  -- theme
  use("morhetz/gruvbox")
  use("joshdick/onedark.vim")
  use('tomasr/molokai')
  use('altercation/vim-colors-solarized')
  use('folke/tokyonight.nvim')

  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }
  -- telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
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
  use {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  -- org mode
  use { 'nvim-orgmode/orgmode', config = function()
    require('orgmode').setup {}
  end
  }

  -- syntax highlight
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }


  -- replacw with neogit
  --[[ use 'tpope/vim-fugitive' ]]

  -- completion
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  -- for snippets
  use({ "L3MON4D3/LuaSnip", tag = "1.1.0" }) --snippet engine
  use("saadparwaiz1/cmp_luasnip") -- snippet completions
  use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

  use({ "jose-elias-alvarez/null-ls.nvim",
    requires = { "nvim-lua/plenary.nvim" },
  }) -- for formatters and linters

  use {
    "neovim/nvim-lspconfig",
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',

      -- Additional lua configuration, makes nvim stuff amazing
      'folke/neodev.nvim',
    }
  }

  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
  })

  -- file explorer
  use {
    'nvim-tree/nvim-tree.lua',
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  -- mouse
  use {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }

  use {
    'ggandor/leap.nvim',
    config = function()
      require('leap').add_default_mappings()
    end
  }
  use('Lokaltog/vim-easymotion')
  use('tpope/vim-repeat')

  use("numToStr/Comment.nvim") -- Easily comment stuff
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  --
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

  --[[ use { ]]
  --[[   'declancm/maximize.nvim', ]]
  --[[   config = function() ]]
  --[[     require('maximize').setup() ]]
  --[[   end ]]
  --[[ } ]]

  use {
    'declancm/windex.nvim',
    config = function() require('windex').setup() end
  }

  -- use("kyazdani42/nvim-web-devicons")
  use { 'nvim-tree/nvim-web-devicons',
    config = function()
      require 'nvim-web-devicons'.setup {
        -- your personnal icons can go here (to override)
        -- you can specify color or cterm_color instead of specifying both of them
        -- DevIcon will be appended to `name`
        override = {
          zsh = {
            icon = "",
            color = "#428850",
            cterm_color = "65",
            name = "Zsh"
          }
        };
        -- globally enable different highlight colors per icon (default to true)
        -- if set to false all icons will have the default icon's color
        color_icons = true;
        -- globally enable default icons (default to false)
        -- will get overriden by `get_icons` option
        default = true;
      }
    end
  }
  -- format

  use("mattn/emmet-vim")
  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  })

  use({ "mhanberg/elixir.nvim", requires = { "nvim-lua/plenary.nvim" } })
  -- for jbuider file
  use("figitaki/vim-dune")
  use("idanarye/vim-merginal")
  use('rbong/vim-flog')

  -- test
  use('vim-test/vim-test')

  -- wirte
  use('davidbeckingsale/writegood.vim')

  -- debug
  use('mfussenegger/nvim-dap')
  use {
    'leoluz/nvim-dap-go',
    config = function()
      require('dap-go').setup()
    end
  }

  -- for Golang dev
  --[[ use('fatih/vim-go') ]]

  -- chatgpt
  --[[ use({ ]]
  --[[   "jackMort/ChatGPT.nvim", ]]
  --[[   config = function() ]]
  --[[     require("chatgpt").setup({ ]]
  --[[       -- optional configuration ]]
  --[[     }) ]]
  --[[   end, ]]
  --[[   requires = { ]]
  --[[     "MunifTanjim/nui.nvim", ]]
  --[[     "nvim-lua/plenary.nvim", ]]
  --[[     "nvim-telescope/telescope.nvim" ]]
  --[[   } ]]
  --[[ }) ]]

  use {
    'LukasPietzschmann/telescope-tabs',
    requires = { 'nvim-telescope/telescope.nvim' },
    config = function()
      require 'telescope-tabs'.setup {
        -- Your custom config :^)
      }
    end
  }

  --[[ use('github/copilot.vim') ]]
  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }

  -- highlight other uses of the word under cursor
  use { 'RRethy/vim-illuminate' }

  -- multi cusor
  use('mg979/vim-visual-multi')

  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

  -- better vim UI
  use { 'stevearc/dressing.nvim' }

  -- Packer
  use({
    "folke/noice.nvim",
    config = function()
      require("noice").setup({
        -- add any options here
      })
    end,
    requires = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    }
  })
end)
