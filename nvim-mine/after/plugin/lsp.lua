local vim = vim
local lsp_zero = require("lsp-zero")
local lspconfig = require("lspconfig")
local lspkind = require('lspkind')
local cmp = require("cmp")
local builtin = require('telescope.builtin')
local cmp_format =

    lspkind.init({
      symbol_map = {
        Text = "󰉿",
        Method = "󰆧",
        Function = "󰊕",
        Constructor = "",
        Field = "󰜢",
        Variable = "󰀫",
        Class = "󰠱",
        Interface = "",
        Module = "",
        Property = "󰜢",
        Unit = "󰑭",
        Value = "󰎠",
        Enum = "",
        Keyword = "󰌋",
        Snippet = "",
        Color = "󰏘",
        File = "󰈙",
        Reference = "󰈇",
        Folder = "󰉋",
        EnumMember = "",
        Constant = "󰏿",
        Struct = "󰙅",
        Event = "",
        Operator = "󰆕",
        TypeParameter = "",
        Copilot = "",
      },
    })

lsp_zero.preset("recommended")

local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp_zero.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ['<C-CR>'] = cmp.mapping.confirm({ select = true }),
  ['<CR>'] = cmp.mapping.confirm({ select = true }),
  ['<C-Space>'] = cmp.mapping.complete(),
})

lspconfig.dartls.setup {}

lsp_zero.set_preferences({
  sign_icons = {
  }
})

cmp.setup({
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol',
      maxwidth = 50,
      ellipsis_char = '...',
    })
  },
  mapping = cmp.mapping.preset.insert(cmp_mappings),
  sources = {
    { name = "nvim_lsp" },
    { name = "path" },
    { name = "luasnip" },
    { name = "buffer" },
    -- { name = "copilot" },
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  }
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
    async = true,
    timeout_ms = 10000,
  },
  servers = {
    ['null-ls'] = { 'javascript', 'typescript', 'vue', 'css', 'php', 'javascriptreact', 'typescriptreact', 'lua' },
  }
})

lsp_zero.setup()

local null_ls = require('null-ls')

null_ls.setup({
  timeout_ms = 10000,
  sources = {
    null_ls.builtins.formatting.prettierd,
    -- null_ls.builtins.formatting.eslint,
    -- null_ls.builtins.formatting.gofmt,
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

lspconfig.ts_ls.setup({})
lspconfig.volar.setup {
  filetypes = { 'vue' }
}
lspconfig.emmet_ls.setup {
  filetypes = { 'html', 'css', 'javascript', 'typescript', 'vue' }
}

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    "ts_ls",
    "eslint",
    "lua_ls",
    "rust_analyzer",
    "volar",
    "jsonls",
    "yamlls",
    "tailwindcss",
    "emmet_ls",
    -- "gopls"
  },
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
    volar = function()
      require('lspconfig').volar.setup({})
    end,
    ts_ls = function()
      local vue_typescript_plugin = require('mason-registry')
          .get_package('vue-language-server')
          :get_install_path()
          .. '/node_modules/@vue/language-server'
          .. '/node_modules/@vue/typescript-plugin'

      require('lspconfig').ts_ls.setup({
        init_options = {
          plugins = {
            {
              name = "@vue/typescript-plugin",
              location = vue_typescript_plugin,
              languages = { 'javascript', 'typescript', 'vue' }
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
    lua_ls = function()
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
    eslint = function()
      require('lspconfig').eslint.setup {
        settings = {
          codeActionOnSave = {
            enable = true,
            mode = "all"
          },
        }
      }
    end
  },
})
