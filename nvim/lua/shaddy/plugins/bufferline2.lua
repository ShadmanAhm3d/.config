 return{
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
      { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
    },
    opts = {
      options = {
        -- stylua: ignore
        close_command = function(n) require("mini.bufremove").delete(n, false) end,
        -- stylua: ignore
        right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
        diagnostics = "nvim_lsp",
        always_show_bufferline = false,
        offsets = {
          {
            filetype = "neo-tree",
            text = "Neo-tree",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    },
  }
--[[ return { ]]
--[[   "akinsho/bufferline.nvim", ]]
--[[   config=function ()  ]]
--[[     local status_ok, bufferline = pcall(require, "bufferline") ]]
--[[     if not status_ok then ]]
--[[       return ]]
--[[     end ]]
--[[]]
--[[     bufferline.setup({ ]]
--[[       options = { ]]
--[[         animation = true, ]]
--[[]]
--[[         -- Enable/disable auto-hiding the tab bar when there is a single buffer ]]
--[[         auto_hide = true, ]]
--[[]]
--[[         closable = true, ]]
--[[         modified_icon = '  ● ', ]]
--[[         tab_size = 24, ]]
--[[         clickable = true, ]]
--[[         exclude_ft = {}, ]]
--[[         exclude_name = {}, ]]
--[[         icons = false, ]]
--[[         icon_custom_colors = false, ]]
--[[         insert_at_end = false, ]]
--[[         insert_at_start = false, ]]
--[[         maximum_padding = 5, ]]
--[[         maximum_length = 30, ]]
--[[         semantic_letters = true, ]]
--[[         letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP', ]]
--[[         no_name_title = nil, ]]
--[[       }, ]]
--[[]]
--[[       highlights = { ]]
--[[         fill = { ]]
--[[           fg = '#1f1f1f', ]]
--[[           bg = '#575757', ]]
--[[         }, ]]
--[[         buffer_selected = { ]]
--[[           fg = '#1f1f1f', ]]
--[[           bg = '#f06056', ]]
--[[           italic = false, ]]
--[[           bold = false, ]]
--[[           icon = false, ]]
--[[         }, ]]
--[[         modified = { ]]
--[[           fg = '#1f1f1f', ]]
--[[           bg = '#f06056', ]]
--[[         }, ]]
--[[         modified_selected = { ]]
--[[           fg = '#1f1f1f', ]]
--[[           bg = '#f06056', ]]
--[[         }, ]]
--[[]]
--[[         modified_visible = { ]]
--[[           fg = '#1f1f1f', ]]
--[[           bg = '#f06056', ]]
--[[         }, ]]
--[[         close_button_selected = { ]]
--[[           fg = '#1f1f1f', ]]
--[[           bg = '#f06056', ]]
--[[         }, ]]
--[[       } ]]
--[[]]
--[[     }) ]]
--[[   end ]]
--[[ } ]]
