local vim = vim
local lsp_zero = require("lsp-zero")
local lspconfig = require("lspconfig")
local lspkind = require('lspkind')
local cmp = require("cmp")
local builtin = require('telescope.builtin')

lspkind.init({
    symbol_map = {
      Copilot = "",
    },
  })

lsp_zero.preset("recommended")

local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp_zero.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-CR>'] = cmp.mapping.confirm({ select = true }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
  })

lspconfig.dartls.setup {}

lsp_zero.set_preferences({
    sign_icons = {}
  })

lsp_zero.setup_nvim_cmp({
    sources = {
      { name = "copilot" },
      { name = "nvim_lsp" },
      { name = "path" },
      { name = "luasnip" },
      { name = "buffer" },
    },
    formatting = {
      format = lspkind.cmp_format({ mode = 'symbol', with_text = true, maxwidth = 50 })
    },
    mapping = cmp_mappings,
  })

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({ buffer = bufnr })

  vim.keymap.set('n', 'gr', builtin.lsp_references, { buffer = bufnr })
  vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, {})
  vim.keymap.set('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<cr>')
  vim.keymap.set('n', '<leader>lf', '<cmd>lua vim.lsp.buf.format()<cr>')
  vim.keymap.set('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<cr>')
end)

lsp_zero.format_on_save({
    format_opts = {
      async = false,
      timeout_ms = 10000,
    },
    servers = {
      ['null-ls'] = { 'javascript', 'typescript', 'vue', 'css', 'php', 'javascriptreact', 'typescriptreact', 'go' },
    }
  })

lsp_zero.setup()

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

lspconfig.tsserver.setup({})
lspconfig.volar.setup {
  filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'}
}

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
      "tsserver",
      "eslint",
      "lua_ls",
      "rust_analyzer",
      "volar",
      "jsonls",
      "yamlls",
      "tailwindcss",
      "emmet_ls",
      "gopls"
    },
    handlers = {
      function(server_name)
        require('lspconfig')[server_name].setup({})
      end,
      volar = function()
        require('lspconfig').volar.setup({})
      end,
      tsserver = function()
        local vue_typescript_plugin = require('mason-registry')
          .get_package('vue-language-server')
          :get_install_path()
        .. '/node_modules/@vue/language-server'
        .. '/node_modules/@vue/typescript-plugin'

        require('lspconfig').tsserver.setup({
            init_options = {
              plugins = {
                {
                  name = "@vue/typescript-plugin",
                  location = vue_typescript_plugin,
                  languages = {'javascript', 'typescript', 'vue'}
                },
              }
            },
            filetypes = {
              'javascript',
              'javascriptreact',
              'javascript.jsx',
              'typescript',
              'typescriptreact',
              'typescript.tsx',
              'vue',
            },
          })
      end,
    },
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup {
        settings = {
            Lua = {
                diagnostics = {
                    globals = { 'vim' }
                }
            }
        }
      }
    end,
  })
