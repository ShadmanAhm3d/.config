return {
  "luochen1990/rainbow",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
-- Enable the plugin for Lua filetypes
vim.g.rainbow_active = 1

-- Configure the colors used for bracket pairs (optional)
vim.g.rainbow_conf = {
  guifgs = { "RoyalBlue3", "DarkOrange3", "SeaGreen3", "Goldenrod3", "Orchid3" },
  guibgs = {},
  ctermfgs = {},
  ctermbgs = {},
}
  end,
    }
