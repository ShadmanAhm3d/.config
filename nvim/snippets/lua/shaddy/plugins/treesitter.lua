return {
  "nvim-treesitter/nvim-treesitter",
  module = true,
  event = { "BufReadPost", "BufNewFile" },
  cmd = {
    "TSInstall",
    "TSInstallInfo",
    "TSUpdate",
    "TSBufEnable",
    "TSBufDisable",
    "TSEnable",
    "TSDisable",
    "TSModuleInfo",
  },
  dependencies = {
    {
      "lukas-reineke/indent-blankline.nvim",
      config = function()
        local indent_blankline = require "indent_blankline"

        indent_blankline.setup {
          show_current_context = true,
          indent_blankline_char = "▏",
          indent_blankline_show_trailing_blankline_indent = false,
          indent_blankline_show_first_indent_level = true,
          indent_blankline_use_treesitter = true,
          indent_blankline_show_current_context = true,
          indent_blankline_buftype_exclude = { "terminal", "nofile" },
          indent_blankline_filetype_exclude = {
            "help",
          },
        }
      end,
    }, -- Indentline
  },
  build = ":TSUpdate",
  config = function()
    local configs = require "nvim-treesitter.configs"

    configs.setup {
      ensure_installed = { "cpp", "lua", "c", "go", "python", "java" }, -- one of "all" or a list of languages
      highlight = {
        enable = true, -- false will disable the whole extension
        disable = { "css" }, -- list of language that will be disabled
      },
      autopairs = {
        enable = true,
      },
      indent = { enable = false, disable = {} },
      playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
          toggle_query_editor = "o",
          toggle_hl_groups = "i",
          toggle_injected_languages = "t",
          toggle_anonymous_nodes = "a",
          toggle_language_display = "I",
          focus_language = "f",
          unfocus_language = "F",
          update = "R",
          goto_node = "<cr>",
          show_help = "?",
        },
      },
    }
  end,
}
