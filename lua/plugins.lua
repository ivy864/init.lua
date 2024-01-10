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
    "techtuner/aura-neovim",
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
            'saadparwaiz1/cmp_luasnip',

            -- other snippets
            'rafamadriz/friendly-snippets',

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

            { 'j-hui/fidget.nvim', opts = {} },

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
                icons_enabled = false,
                component_seperators = '|',
                section_separators = '',
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
})

require("config/nvim-cmp")
require("config/treesitter")
require("config/telescope")
