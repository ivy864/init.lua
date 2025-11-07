-- ui ig
vim.opt.syntax = "on"
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.bg = 'dark'
vim.opt.signcolumn = 'yes'
vim.opt.colorcolumn = {80}

-- tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.autoindent = true

-- search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- other stuffs
vim.opt.wildmode = 'list'
vim.opt.mouse = ''
vim.opt.completeopt = 'menuone,noselect'
vim.opt.breakindent = true

vim.opt.number = true
vim.opt.relativenumber = true

-- vimscript
vim.cmd([[
    setlocal spell spelllang=en_us
    hi Normal guibg=NONE ctermbg=NONE
    filetype plugin on
]])

-- language specific
vim.g.sass_recommended_style = 0
vim.g.c_syntax_for_h = 1

vim.api.nvim_create_autocmd("FileType", {
    pattern = "llvm",
    callback = function()
        vim.opt.spell = false
    end,
})
