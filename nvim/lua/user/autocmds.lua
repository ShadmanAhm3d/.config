--This is autocmd to hightlight texts on yank
local augroup = vim.api.nvim_create_augroup
local yank_group = augroup('HighlightYank', {})

vim.api.nvim_create_autocmd('TextYankPost', {
  group = yank_group,

  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 40,
    })
  end,
})
--ends

--bufferline
vim.cmd [[   
  nnoremap <silent><TAB> :BufferLineCycleNext<CR>
  nnoremap <silent><S-TAB> :BufferLineCyclePrev<CR>
]]
--autocommand to disable bufferline at alpha dashboard
vim.cmd [[  autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2]]



--NOTE => Colors for the system

vim.cmd[[ hi GitSignsAdd guibg=Normal guifg=yellow]]


--vertsplit highlight off
vim.cmd[[ hi SignColumn guibg=none]]
-- ~ sign off
vim.api.nvim_set_hl(0, "EndofBuffer", { fg="#282828", bg="none"})
vim.api.nvim_set_hl(0, "TelescopeTitle", {  bg="black"})

vim.api.nvim_set_hl(0, "LineNr", { bg="#282828"} ) -- for vscode theme
vim.api.nvim_set_hl(0, "WinSeparator", { bg = nil, fg = nil })
vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", { link = "WinSeparator" })









