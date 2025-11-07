local map = require('mini.map')

require('mini.map').setup()


local nmap = function(keys, func, desc)
    if desc then
        desc = 'LSP: ' .. desc
    end

   vim.keymap.set('n', keys, func, {desc = desc})
end

nmap('<Leader>mo', MiniMap.open, '[M]iniMap [O]pen')
nmap('<Leader>mc', MiniMap.close, '[M]iniMap [C]lose')


