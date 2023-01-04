local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
  profile = {
    enable = true,
    threshold = 0 -- the amount in ms that a plugin's load time must be over for it to be included in the profile
  },
}

-- Install your plugins herecharacter). p will then paste the line on a new line after t
return packer.startup(function(use)
  -- My plugins here
  use "VonHeikemen/lsp-zero.nvim"
  use 'lewis6991/impatient.nvim'
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "numToStr/Comment.nvim" -- Easily comment stuff
  use "kyazdani42/nvim-web-devicons"
  use { "kyazdani42/nvim-tree.lua" }
  use {
    "akinsho/bufferline.nvim",
  }

  use "mbbill/undotree"
  use "moll/vim-bbye"
  use 'nvim-lualine/lualine.nvim'
  use "akinsho/toggleterm.nvim"
  use({
    "xiyaowong/nvim-transparent", 
  })
  use {
    'rcarriga/nvim-notify',
    config = function()
      require("notify").setup {
        stages = 'fade_in_slide_out',
        background_colour = 'FloatShadow',
        timeout = 3000,
      }
    end
  }
  -- Colorschemes
  use "/home/Shad/plugin/stackmap.nvim"
  use "lunarvim/horizon.nvim"
  use "sainnhe/sonokai" --sonokai
  use({
    'rose-pine/neovim',
  })
  use { "ellisonleao/gruvbox.nvim" }

  -- cmp plugins

  use {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    config = function()
      require("user.cmp")
    end
  } -- The completion plugin
  use { "hrsh7th/cmp-buffer", after = "nvim-cmp" } -- buffer completions
  use { "hrsh7th/cmp-path", after = "nvim-cmp" } -- path completions 
  use { "hrsh7th/cmp-cmdline", after = "nvim-cmp" } -- cmdline completions
  use { "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" } -- snippet completions
  use { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" }

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use "jayp0521/mason-null-ls.nvim" --mason bridge less
 use { 
    "jose-elias-alvarez/null-ls.nvim",
    event="BufWinEnter",
    config = function ()
      require("user.null-ls")
    end
  } 
  use { "williamboman/mason.nvim" }
  use "williamboman/mason-lspconfig.nvim"
  -- Telescope
  use "nvim-telescope/telescope.nvim"

  -- Treesitter,lazyloading done
  use {
    "nvim-treesitter/nvim-treesitter",
    module = "nvim-treesitter",
    event = "BufRead",
    cmd = {
      "TSInstall",
      "TSInstallInfo",
      "TSUpdate",
      "TSBufEnable",
      "TSBufDisable",
      "TSEnable",
      "TSDisable",
      "TSModuleInfo",
    },
    config = function()
      require("user.treesitter")
    end
  }





  use "JoosepAlviste/nvim-ts-context-commentstring"
  -- nvim colorozer
  use "norcalli/nvim-colorizer.lua"

  --Dashboard
  use {
    'goolord/alpha-nvim'
  }


  --nvim surround
  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
})

use {
	'xeluxee/competitest.nvim',
	requires = 'MunifTanjim/nui.nvim',
}










  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
