require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "lua", "c", "rust", "javascript", "typescript", "vue", "php", "typescript", "prisma" },
    sync_install = false,
    auto_install = true,
    indent = {
        enable = true,
    },
    highlight = {
        enable = true,
        -- additional_vim_regex_highlighting = false,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },
}
