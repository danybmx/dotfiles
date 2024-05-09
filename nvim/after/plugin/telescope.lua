local telescope = require('telescope')
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>pw', builtin.live_grep, {})
vim.keymap.set('n', '<leader>pg', builtin.grep_string, {})
vim.keymap.set('v', '<leader>pg', builtin.grep_string, {})

telescope.setup {
    defaults = {
        path_display = { "truncate" }
    }
}
