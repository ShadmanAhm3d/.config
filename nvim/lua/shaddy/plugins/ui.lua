return {



  --no neckpain.vnim
  {
    "Pocco81/true-zen.nvim",
    config = function()
      require("true-zen").setup {
        -- your config goes here
        -- or just leave it empty :)
        modes = {
          ataraxis = {
            shade = "dark", -- if `dark` then dim the padding windows, otherwise if it's `light` it'll brighten said windows
            backdrop = 0,   -- percentage by which padding windows should be dimmed/brightened. Must be a number between 0 and 1. Set to 0 to keep the same background color
            minimum_writing_area = { -- minimum size of main window
              width = 77,
              height = 88,
            },
            quit_untoggles = true, -- type :q or :qa to quit Ataraxis mode
            padding = {   -- padding windows
              left = 0,
              right = 0,
              top = 0,
              bottom = 0,
            },
            callbacks = { -- run functions when opening/closing Ataraxis mode
              open_pre = nil,
              open_pos = nil,
              close_pre = nil,
              close_pos = nil
            },
          },
minimalist = {
			ignored_buf_types = { "nofile" }, -- save current options from any window except ones displaying these kinds of buffers
			options = { -- options to be disabled when entering Minimalist mode
				number = true,
				relativenumber = true,
				showtabline = 0,
				signcolumn = "no",
				statusline = "",
				cmdheight = 1,
				laststatus = 0,
				showcmd = false,
				showmode = false,
				ruler = false,
				numberwidth = 16
			},
			callbacks = { -- run functions when opening/closing Minimalist mode
				open_pre = nil,
				open_pos = nil,
				close_pre = nil,
				close_pos = nil
			},
		},
        },




        integrations = {
          tmux = false, -- hide tmux status bar in (minimalist, ataraxis)
          kitty = {     -- increment font size in Kitty. Note: you must set `allow_remote_control socket-only` and `listen_on unix:/tmp/kitty` in your personal config (ataraxis)
            enabled = true,
            font = "+13",
          },
          twilight = false, -- enable twilight (ataraxis)
          lualine = true,   -- hide nvim-lualine (ataraxis)
        },
      }
    end,
  },


  --live-server
  {
    'barrett-ruth/live-server.nvim',
    build = 'yarn global add live-server',
    config = true
  },



  --transaprent.vnim
  {
    "xiyaowong/nvim-transparent",
    config = function()
      require("transparent").setup({
        --[[ enable = false, -- boolean: enable transparent for all time ]]
        extra_groups = { -- table/string: additional groups that should be cleared
          -- In particular, when you set it to 'all', that means all available groups

          -- example of akinsho/nvim-bufferline.lua
          --[[ "BufferLineTabClose", ]]
          --[[ "BufferlineBufferSelected", ]]
          --[[ "BufferLineFill", ]]
          --[[ "BufferLineBackground", ]]
          "BufferLineFill",
          --[[ "BufferLineSeparator", ]]
          --[[ "BufferLineIndicatorSelected", ]]
          "LuaLineBackground",
          "NvimTreeNormal",
          "Packer",
          "Mason"
        },
      })
    end
  },
}
