local opts = {
    noremap = true,
    silent = true,
}

-- resize windows w/ arrow keys
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical +2<CR>', opts)

-- increment/decrement tab level (but betterer)
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

