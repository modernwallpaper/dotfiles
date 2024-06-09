local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
  return
end

return packer.startup(function(use)
  use "wbthomason/packer.nvim"
  use {
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        position = "bottom",
        -- icons = true,
        fold_open = "",
        fold_closed = "",
        keys = {
          ["?"] = "help",
          r = "refresh",
          R = "toggle_refresh",
          q = "close",
          o = "jump_close",
          ["<esc>"] = "cancel",
          ["<cr>"] = "jump",
          ["<2-leftmouse>"] = "jump",
          ["<c-s>"] = "jump_split",
          ["<c-v>"] = "jump_vsplit",
          -- go down to next item (accepts count)
          -- j = "next",
          ["<DOWN>"] = "next",
          ["]]"] = "next",
          -- go up to prev item (accepts count)
          -- k = "prev",
          ["<UP>"] = "prev",
          ["[["] = "prev",
        }
      }
    end
  }

  use { "nvim-tree/nvim-tree.lua" }
  use { "nvim-tree/nvim-web-devicons" }
  use "MunifTanjim/nui.nvim"

  -- many functions that lua plugin use
  use "nvim-lua/plenary.nvim"

  -- colorschemes
  use "ellisonleao/gruvbox.nvim"
  use "rose-pine/neovim"
  use "craftzdog/solarized-osaka.nvim"
  use "navarasu/onedark.nvim"
  use { "catppuccin/nvim", as = "catppuccin" }
  use { "sainnhe/sonokai" }

  -- commenting with gc
  use "numToStr/Comment.nvim"


  -- status line
  use "nvim-lualine/lualine.nvim"

  use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}

  -- telescope
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-fzf-native.nvim"

  -- autocomp
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"

  -- snippets 
  use "L3MON4D3/LuaSnip"
  use "saadparwaiz1/cmp_luasnip"
  use "rafamadriz/friendly-snippets"

  -- lsp
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"

  -- lsp servers config
  use "neovim/nvim-lspconfig"
  use "hrsh7th/cmp-nvim-lsp"
  use "glepnir/lspsaga.nvim"
  use "onsails/lspkind.nvim"

  use { "nvim-neo-tree/neo-tree.nvim" }

  -- treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = function ()
      require("nvim-treesitter").update({ with_sync = true })
    end,
  }

  -- auto closingg
  use "windwp/nvim-autopairs"
  use "windwp/nvim-ts-autotag"

  -- git intergration
  use "lewis6991/gitsigns.nvim"

  use "goolord/alpha-nvim"

  -- heirline
  use "rebelot/heirline.nvim"

  if packer_bootstrap then
    require("packer").sync()
  end
end)
