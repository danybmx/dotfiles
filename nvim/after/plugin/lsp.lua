local lsp = require("lsp-zero")
local lspconfig = require("lspconfig")
local telescope_builtin = require('telescope.builtin')

lsp.preset("recommended")

lsp.ensure_installed({
    "tsserver",
    "eslint",
    "lua_ls",
    "rust_analyzer",
    "volar",
    "lemminx",
    "jsonls",
    "yamlls",
    "tailwindcss",
    "emmet_ls",
    "gopls",
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-CR>'] = cmp.mapping.confirm({ select = true }),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    ['<C-Space>'] = cmp.mapping.complete(),
})

lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
lspconfig.dartls.setup{}

lsp.set_preferences({
    sign_icons = {}
})

lsp.setup_nvim_cmp({
    sources = {
        { name = "buffer" },
        { name = "path" },
        { name = "luasnip" },
        { name = "nvim_lsp" },
    },
    mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })

    vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', { buffer = bufnr })
    vim.keymap.set('n', '<leader>ps', telescope_builtin.lsp_document_symbols, {})
    vim.keymap.set('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<cr>')
    vim.keymap.set('n', '<leader>f', '<cmd>lua vim.lsp.buf.format()<cr>')
    vim.keymap.set('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<cr>')
end)

lsp.format_on_save({
    format_opts = {
        async = false,
        timeout_ms = 10000,
    },
    servers = {
        ['null-ls'] = { 'javascript', 'typescript', 'vue', 'css', 'php', 'javascriptreact', 'typescriptreact', 'go' },
    }
})

lsp.setup()

local null_ls = require('null-ls')

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.blade_formatter,
        null_ls.builtins.formatting.phpcsfixer.with({
            args = { '--allow-risky=yes', 'fix', '$FILENAME' },
        }),
        null_ls.builtins.diagnostics.php,
        null_ls.builtins.diagnostics.phpcs.with({
            extra_args = { '--standard', 'WordPress' },
            cmd = '/Users/drodriguez/.composer/vendor/bin/phpcs'
        }),
    }
})
