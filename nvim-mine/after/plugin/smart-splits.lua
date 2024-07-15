require('smart-splits').setup({
  -- Ignored buffer types (only while resizing)
  ignored_buftypes = {
    'nofile',
    'quickfix',
    'prompt',
  },
  ignored_filetypes = { 'NvimTree' },
  default_amount = 3,
  at_edge = 'wrap',
  float_win_behavior = 'previous',
  move_cursor_same_row = false,
  cursor_follows_swapped_bufs = false,
  resize_mode = {
    quit_key = '<ESC>',
    resize_keys = { 'h', 'j', 'k', 'l' },
    silent = false,
  },
  ignored_events = {
    'BufEnter',
    'WinEnter',
  },
  multiplexer_integration = "wezterm",
  disable_multiplexer_nav_when_zoomed = true,
  log_level = 'info',
})

vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left)
vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down)
vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up)
vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right)
vim.keymap.set('n', '<C-\\>', require('smart-splits').move_cursor_previous)
