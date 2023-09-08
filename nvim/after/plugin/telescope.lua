local builtin = require('telescope.builtin')
require("drodriguez.set");
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pt', builtin.treesitter, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>pw', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
