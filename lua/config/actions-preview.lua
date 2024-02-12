require("actions-preview").setup {
    highlight_command = {
        require("actions-preview.highlight").delta("delta --no-gitconfig --side-by-side"),
    },

    --vim.keymap.set({'n', 'v'}, '<leader>ca', require("actions-preview").code_actions, {silent = true, noremap = true})

}

--vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)
