local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)


vim.g.mapleader = " "
vim.g.maplocalleader = " "

--require("lazy").setup({{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"}})
require("lazy").setup("shaddy.plugins")
require("shaddy.conf.options")
require("shaddy.conf.autocmds")
require("shaddy.conf.keymaps")


vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = "#3e99fa" })
	end,
})

vim.cmd([[colorscheme gruvbox-baby ]])
-- Set colorscheme

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
