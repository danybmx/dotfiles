require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "lua", "c", "rust", "javascript", "typescript", "vue" },
    sync_install = false,
    auto_install = true,
    indent = {
        enable = true,
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}