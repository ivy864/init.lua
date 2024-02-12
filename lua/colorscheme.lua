require("no-clown-fiesta").setup({
    transparent = true, -- Enable this to disable the bg color
    styles = {
        -- You can set any of the style values specified for `:h nvim_set_hl`
        comments = {},
        keywords = {},
        functions = {},
        variables = {},
        type = { bold = true },
        lsp = { underline = true }
    },
})

local colorscheme = 'no-clown-fiesta'

local is_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
vim.opt.termguicolors = true

if not is_ok then
    vim.notify('colorscheme ' .. colorscheme .. ' not found!')
    return
end
