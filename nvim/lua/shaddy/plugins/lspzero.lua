return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  -- LSP Support
  dependencies = {
    'neovim/nvim-lspconfig', -- Required
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim', -- Optional
    {
      "jay-babu/mason-null-ls.nvim",
      event = { "BufReadPre", "BufNewFile" },
      dependencies = {
        "jose-elias-alvarez/null-ls.nvim",
      },
    },
  },

  config = function()
    local lsp = require("lsp-zero")
    local mason_null_ls = require("mason-null-ls")
    local mason = require("mason")
    lsp.preset("recommended")

    lsp.ensure_installed({
      'lua_ls',
      'rust_analyzer',
      'clangd'
    })

    --[[ lsp.css_lsp.setup{
      autostart = true,
      filetypes = {
         "css", "scss", "less" ,
      }
    } ]]
    -- Fix Undefined global 'vim'
    lsp.configure('lua_ls', {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' }
          }
        }
      }
    })

    mason.setup({
      ui = {
        border = "rounded",
      }
    })


    lsp.set_preferences({
      suggest_lsp_servers = false,
      sign_icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      },
    })

    lsp.on_attach(function(client, bufnr)
      local opts = { buffer = bufnr, remap = false }

      if client.name == "eslint" then
        vim.cmd.LspStop('eslint')
        return
      end

      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "mp", "<cmd>Lspsaga outline<CR>", opts) --saga
      vim.keymap.set("n", "<leader>fi", "<cmd>Lspsaga lsp_finder<CR>", opts) --saga
      vim.keymap.set("n", "K", "<cmd>Lspsaga peek_definition<CR>", opts) --saga
      vim.keymap.set("n", "<leader>a", "<cmd>Lspsaga show_buf_diagnostics<CR> ", opts) --saga
      vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_next<CR> ", opts) --saga
      vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_prev<CR> ", opts) --saga
      vim.keymap.set("n", "<F6>", "<cmd>Lspsaga code_action<CR> ", opts)
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
      vim.keymap.set("n", "<leader>q", vim.lsp.buf.rename, opts)
      vim.keymap.set("i", "<C-h>", vim.diagnostic.setloclist, opts)
      vim.cmd [[ command! Format execute 'lua vim.lsp.buf.format { async = true}' ]]
    end)

    lsp.setup()
    --Mason for formatting
    mason_null_ls.setup({
      ensure_installed = {
        "prettier"
      }
    })



    --diagnostics on line
    vim.diagnostic.config({
      virtual_text = true,
    })
  end
}
