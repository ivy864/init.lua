require('tokyonight').setup {
    style = "night",
    transparent = true,
}

local colorscheme = 'tokyonight-night'

local is_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
vim.opt.termguicolors = true

if not is_ok then
    vim.notify('colorscheme ' .. colorscheme .. ' not found!')
    return
end
