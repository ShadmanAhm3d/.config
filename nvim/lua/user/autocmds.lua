--This is autocmd to hightlight texts on yank
local augroup = vim.api.nvim_create_augroup
local yank_group = augroup('HighlightYank', {})

vim.api.nvim_create_autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})
--ends


--bufferline
vim.cmd[[   
  nnoremap <silent><TAB> :BufferLineCycleNext<CR>
  nnoremap <silent><S-TAB> :BufferLineCyclePrev<CR>
]]
vim.api.nvim_set_hl(0, "WinSeparator", { bg = nil, fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", { link = "WinSeparator" })

