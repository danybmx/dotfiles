require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "lua", "c", "rust", "javascript", "typescript", "vue", "php", "typescript", "prisma" },
    sync_install = false,
    auto_install = true,
    indent = {
        enable = true,
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
        disable = function(_, buf)
            local max_filesize = 50 * 1024 -- 50 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,

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
