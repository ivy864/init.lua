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
        'aznhe21/actions-preview.nvim',
    },
    {
        'mfussenegger/nvim-jdtls',
        ft = {"java"},
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

            local config = {
                cmd = {
                    -- 💀
                    'java', -- or '/path/to/java17_or_newer/bin/java'
                            -- depends on if `java` is in your $PATH env variable and if it points to the right version.

                    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
                    '-Dosgi.bundles.defaultStartLevel=4',
                    '-Declipse.product=org.eclipse.jdt.ls.core.product',
                    '-Dlog.protocol=true',
                    '-Dlog.level=ALL',
                    '-Xmx1g',
                    '--add-modules=ALL-SYSTEM',
                    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
                    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

                    -- 💀
                    '-jar', vim.fn.expand('~/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.900.v20240613-2009.jar'),
                         -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
                         -- Must point to the                                                     Change this to
                         -- eclipse.jdt.ls installation                                           the actual version


                    -- 💀
                    '-configuration', vim.fn.expand('~/.local/share/nvim/mason/packages/jdtls/config_linux'),
                    --'/path/to/jdtls_install_location/config_SYSTEM',
                                    -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
                                    -- Must point to the                      Change to one of `linux`, `win` or `mac`
                                    -- eclipse.jdt.ls installation            Depending on your system.


                    -- 💀
                    -- See `data directory configuration` section in the README
                    '-data', vim.fn.expand('~/.cache/jdtls/workspace') .. project_name
                    --'/path/to/unique/per/project/workspace/folder'
                },

                root_dir = vim.fs.root(0, {".git", "mvnw", "gradlew"}),

                settings = {
                    java = {}
                },
                init_options = {
                    bundles = {}
                },
                capabilities = capabilities,
            }

            require("jdtls").start_or_attach(config)
        end,

    }
})

require("config/actions-preview")
require("config/nvim-cmp")
require("config/treesitter")
require("config/telescope")
--require("config/jdtls")
