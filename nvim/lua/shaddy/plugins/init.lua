return {

--color schemes

'martinsione/darkplus.nvim',
'Mofiqul/vscode.nvim',
"sainnhe/sonokai", --sonokai

'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
 
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      integrations = {
        alpha = true,
        cmp = true,
        flash = true,
        gitsigns = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        lsp_trouble = true,
        mason = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        noice = true,
        notify = true,
        neotree = true,
        semantic_tokens = true,
        telescope = false,
        treesitter = true,
        which_key = true,
      },
    },
  },

-- Add custom plugins to packer from ~/.config/nvim/lua/custom/plugins.lua
}
