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
})

require("config/nvim-cmp")
