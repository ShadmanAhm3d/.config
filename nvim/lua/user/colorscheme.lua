
-- vim.g.tokyonight_style ='storm' 
--vim.g.sonokai_style='shusia'
vim.cmd [[
try
  colorscheme sonokai
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
--Lua:
