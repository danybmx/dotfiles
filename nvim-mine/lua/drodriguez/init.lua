require("drodriguez.packer");
require("drodriguez.set");
require("drodriguez.remap");

vim.g.vimwiki_list = {
  {
    path = '~/Work/wiki/',
    syntax = 'markdown',
    ext = '.md',
  }
}

vim.cmd [[
  augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
  augroup END
]]
