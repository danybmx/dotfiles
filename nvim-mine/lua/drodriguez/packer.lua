local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end
ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use({
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } }
  })

  use 'prisma/vim-prisma'

  use {
    "kyazdani42/nvim-tree.lua",
    requires = "kyazdani42/nvim-web-devicons",
    wants = "nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup()

      require("nvim-tree").setup {
        hijack_cursor = true,
        view = {
          width = 40
        }
      }
    end
  }

  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

  use('onsails/lspkind.nvim')

  use('folke/tokyonight.nvim')

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
  }

  use({
    "kdheepak/lazygit.nvim",
    requires = { { 'nvim-lua/plenary.nvim' } }
  })

  use("sheerun/vim-polyglot")

  use('ThePrimeagen/harpoon')

  use('mbbill/undotree')

  use('tpope/vim-surround')

  use('tpope/vim-commentary')

  use('jose-elias-alvarez/null-ls.nvim')

  use('farmergreg/vim-lastplace')

  use('mfussenegger/nvim-jdtls')

  use
  {
    "tpope/vim-rails",
    config = function()
      -- disable autocmd set filetype=eruby.yaml
      vim.api.nvim_create_autocmd(
        { 'BufNewFile', 'BufReadPost' },
        {
          pattern = { '*.yml' },
          callback = function()
            vim.bo.filetype = 'yaml'
          end

        }
      )
    end
  }

  use { "nvim-treesitter/nvim-treesitter-context" }

  use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }

  use { 'mrjones2014/smart-splits.nvim' }

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  }

  use {
    'CopilotC-Nvim/CopilotChat.nvim',
    branch = "canary",
    requires = {
      { 'nvim-lua/plenary.nvim' }
    },
    config = function()
      require("CopilotChat").setup {
        debug = true, -- Enable debugging
        -- See Configuration section for rest
      }
    end
  }

  use('zbirenbaum/copilot.lua')
  use('zbirenbaum/copilot-cmp')
end)
