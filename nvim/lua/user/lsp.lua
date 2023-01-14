local lsp = require("lsp-zero")
local mason_null_ls = require("mason-null-ls")
local mason = require("mason")
lsp.preset("recommended")

lsp.ensure_installed({
  'sumneko_lua',
  'rust_analyzer',
  'clangd'
})

-- Fix Undefined global 'vim'
lsp.configure('sumneko_lua', {
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
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
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
