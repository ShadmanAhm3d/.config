return {
	{
		"Pocco81/true-zen.nvim",
		config = function()
			require("true-zen").setup {
				-- your config goes here
				-- or just leave it empty :)
				modes = { -- configurations per mode
					ataraxis = {
						shade = "dark", -- if `dark` then dim the padding windows, otherwise if it's `light` it'll brighten said windows
						backdrop = 0, -- percentage by which padding windows should be dimmed/brightened. Must be a number between 0 and 1. Set to 0 to keep the same background color
						minimum_writing_area = { -- minimum size of main window
							width = 70,
							height = 44,
						},
						quit_untoggles = true, -- type :q or :qa to quit Ataraxis mode
						padding = { -- padding windows
							left = 52,
							right = 52,
							top = 5,
							bottom = 5,
						},
					},
					minimalist = {
						ignored_buf_types = { "nofile" }, -- save current options from any window except ones displaying these kinds of buffers
						options = { -- options to be disabled when entering Minimalist mode
							number = false,
							relativenumber = false,
							showtabline = 0,
							signcolumn = "no",
							statusline = "",
							cmdheight = 1,
							laststatus = 0,
							showcmd = false,
							showmode = false,
							ruler = false,
							numberwidth = 1,
						},
					},
					narrow = {
						folds_style = "invisible",
						run_ataraxis = true, -- display narrowed text in a Ataraxis session
					},
				},
				integrations = {
					tmux = false, -- hide tmux status bar in (minimalist, ataraxis)
					kitty = { -- increment font size in Kitty. Note: you must set `allow_remote_control socket-only` and `listen_on unix:/tmp/kitty` in your personal config (ataraxis)
						enabled = false,
						font = "+3",
					},
					twilight = false, -- enable twilight (ataraxis)
					lualine = false,
				},
			}
		end,
	}
}
