-- ui ig
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.bg = 'dark'
vim.opt.signcolumn = 'yes'

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

-- vimscript
vim.cmd([[
    "setlocal spell spelllang=en_us
]])
