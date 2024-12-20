function SetColor(color)
    vim.cmd.colorscheme(color)
    vim.g.airline_theme = color
    vim.cmd.highlight("iCursor guifg=black guibg=white")
    vim.opt.guicursor = "v-n-c:block-Cursor,i:block-Cursor"
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalSB", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg = "none" })
    vim.api.nvim_set_hl(0, "Visual", { bg = "white", fg = "black" })
end

SetColor('tokyonight')

