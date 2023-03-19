return {
  {
    "folke/zen-mode.nvim",

    cmd = {
      "ZenMode",
    },
    config = function()
      require("zen-mode").setup {
        window = {
          width = 85,
          options = {
            number = true,
            relativenumber = true,
          }
        },
      }
    end
  }
}
