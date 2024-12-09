vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- lazy plugin manager (https://github.com/folke/lazy.nvim)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    --{"techtuner/aura-neovim"},
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },

    {"folke/which-key.nvim", opts = {}},

    {
        'lewis6991/gitsigns.nvim',
        opts = {
            -- See `:help gitsigns.txt`
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
        },
    },
    {
        -- completion engine
        'hrsh7th/nvim-cmp',
        dependencies = {
            -- lua snippets 
            'L3MON4D3/LuaSnip',
            "rafamadriz/friendly-snippets",

            'saadparwaiz1/cmp_luasnip',

            -- LSP completion capabilities
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
        },

    },

    {
        -- LSP
        'neovim/nvim-lspconfig',
        dependencies = {
            { 'williamboman/mason.nvim', config = true },
            'williamboman/mason-lspconfig.nvim',

            {
                'j-hui/fidget.nvim', opts = {
                    progress = {
                        suppress_on_insert = true,
                    },
                }
            },

            'folke/neodev.nvim',
        },
    },

    {
        -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        build = ':TSUpdate',
    },

    {
        'nvim-lualine/lualine.nvim',
        opts = {
            options = {
                icons_enabled = true,
            },
            sections = {
                lualine_a = {'mode'},
                lualine_b = {'branch', 'diff', 'diagnostics'},
                lualine_c = {'filename'},

                lualine_x = {'%b'},
                lualine_y = {'progress'},
                lualine_z = {'location'}
            },
            inactive_sections = {
                lualine_a = {'filename'},
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {'location'}
            }
        }
    },

    {
        'lukas-reineke/indent-blankline.nvim',
        main = 'ibl',
        opts = {},
    },

    { 'numToStr/Comment.nvim', opts = {} },

    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
                cond = function()
                    return vim.fn.executable 'make' ==  1
                end
            },
        },
    },

    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {}
    },
    {
        'windwp/nvim-ts-autotag',
        opts = {
        }
    },

    {
        'aznhe21/actions-preview.nvim',
    },
    {
        'mfussenegger/nvim-jdtls',
    },
    --[[
    {
        'lewis6991/satellite.nvim'
    },
    --]]
    {
        'DNLHC/glance.nvim'
    },
    {
        'llvm/llvm.vim'
    }


})

require("config/actions-preview")
require("config/nvim-cmp")
require("config/treesitter")
require("config/telescope")
require("config/jdtls")
