return{
   "akinsho/toggleterm.nvim",
   config=function()
     require("toggleterm").setup({
  size = 40,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_terminals = false,
      insert_mappings = true,
      persist_size = true,
      direction = "vertical",
      close_on_exit = true,
      shell = vim.o.shell,
      autochdir = true,
      highlights = {
        Normal = {
          guibg="#1e1e1e",
        },
        NormalFloat = {
          link = "Normal",
        },
        FloatBorder = {
          link = "FloatBorder",
        },
      },
      float_opts = {
        border = "rounded",
        winblend = 0,
      },
         
     })
   end
}
