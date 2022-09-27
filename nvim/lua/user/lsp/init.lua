local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

--[[ require "user.lsp.lsp-installer" ]]

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
require("mason-lspconfig").setup({
    ensure_installed = { "sumneko_lua", "rust_analyzer", "clangd"}
})

require("user.lsp.handlers").setup()
require'lspconfig'.tsserver.setup{
  autostart = true
}
require "user.lsp.null-ls"
require'lspconfig'.csharp_ls.setup{
  autostart = true
}
--
require'lspconfig'.sumneko_lua.setup{
  autostart = true
}
require'lspconfig'.clangd.setup{
  autostart = true
}
-- add the configs servers for other languages after setting up the mason and mason-lspconfig like usual
