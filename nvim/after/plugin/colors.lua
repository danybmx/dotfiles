function SetColor(color)
    color = color or "tokyonight-night"
    vim.cmd.colorscheme(color)
    vim.cmd.highlight("iCursor guifg=black guibg=white")
    vim.opt.guicursor = "v-n-c:block-Cursor,i:block-Cursor"
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

SetColor()

