vim.api.nvim_set_hl(0, "GitSignsChange", { fg="lime", bg=Normal})

--vertsplit highlight off
vim.cmd[[ hi SignColumn guibg=none]]
-- ~ sign off 
vim.api.nvim_set_hl(0, "EndofBuffer", { fg="#282828", bg="none"})
vim.api.nvim_set_hl(0, "WinSeparator", { fg="#282828", bg="none"})
vim.api.nvim_set_hl(0, "TelescopeTitle", {  bg="black"})
vim.api.nvim_set_hl(0, "IndentBlankLineChar", {  fg="grey"})
vim.api.nvim_set_hl(0, "Comment", {  fg="red"})

vim.api.nvim_set_hl(0, "LineNr", { bg="#282828"} ) -- for vscode theme
vim.api.nvim_set_hl(0, "WinSeparator", { bg = nil, fg = nil })
vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", { link = "WinSeparator" })


--NOTE => Colors for the system

vim.cmd[[ hi GitSignsAdd guibg=Normal guifg=yellow]]








