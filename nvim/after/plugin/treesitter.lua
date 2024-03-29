require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "lua", "c", "rust", "javascript", "typescript", "vue", "php", "typescript", "prisma" },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
