--Alpha.nvim
return {
	{
		"goolord/alpha-nvim",
		dependencies = {
			"kyazdani42/nvim-web-devicons",
		},
		config = function()
			local present, alpha = pcall(require, "alpha")
			if not present then
				return
			end

			local dashboard = require("alpha.themes.dashboard")
			local if_nil = vim.F.if_nil
			local fn = vim.fn
			local config_dir = fn.stdpath("config")

			-- ╭──────────────────────────────────────────────────────────╮
			-- │ Header                                                   │
			-- ╰──────────────────────────────────────────────────────────╯

			local header = {
				[[ _______             ____   ____.__]],
				[[ \      \   ____  ___\   \ /   /|__| _____]],
				[[ /   |   \_/ __ \/  _ \   Y   / |  |/     \]],
				[[/    |    \  ___(  _ )     /  |  |  Y Y  \]],
				[[\____|__  /\___  >____/ \___/   |__|__|_|  /]],
				[[        \/     \/                        \/]],
			}

			dashboard.section.header.type = "text"
			dashboard.section.header.val = header
			dashboard.section.header.opts = {
				position = "center",
				hl = "Normal",
			}

			-- ╭──────────────────────────────────────────────────────────╮
			-- │ Heading Info                                             │
			-- ╰──────────────────────────────────────────────────────────╯

			local thingy = io.popen('echo "$(date +%a) $(date +%d) $(date +%b)" | tr -d "\n"')
			if thingy == nil then
				return
			end
			local date = thingy:read("*a")
			thingy:close()

			local datetime = os.date(" %H:%M")

			local hi_top_section = {
				type = "text",
				val = "╭────────────   Today is "
				    .. date
				    .. " ────────────╮",
				opts = {
					position = "center",
					hl = "Normal",
				},
			}

			local hi_middle_section = {
				type = "text",
				val = "│                                                │",
				opts = {
					position = "center",
					hl = "Normal",
				},
			}

			local hi_bottom_section = {
				type = "text",
				val = "╰───══───══───══───  "
				    .. datetime
				    .. "  ───══───══───══────╯",
				opts = {
					position = "center",
					hl = "Normal",
				},
			}

			-- ╭──────────────────────────────────────────────────────────╮
			-- │ Buttons                                                  │
			-- ╰──────────────────────────────────────────────────────────╯
			-- Copied from Alpha.nvim source code

			local leader = "SPC"

			--- @param sc string
			--- @param txt string
			--- @param keybind string optional
			--- @param keybind_opts table optional
			local function button(sc, txt, keybind, keybind_opts)
				local sc_ = sc:gsub("%s", ""):gsub(leader, "<leader>")

				local opts = {
					position = "center",
					shortcut = sc,
					cursor = 5,
					width = 25,
					align_shortcut = "right",
					hl_shortcut = "EcovimPrimary",
				}
				if keybind then
					keybind_opts = if_nil(keybind_opts,
						{ noremap = true, silent = true, nowait = true })
					opts.keymap = { "n", sc_, keybind, keybind_opts }
				end

				local function on_press()
					-- local key = vim.api.nvim_replace_termcodes(keybind .. "<Ignore>", true, false, true)
					local key = vim.api.nvim_replace_termcodes(sc_ .. "<Ignore>", true, false, true)
					vim.api.nvim_feedkeys(key, "t", false)
				end

				return {
					type = "button",
					val = txt,
					on_press = on_press,
					opts = opts,
				}
			end

			dashboard.section.buttons.val = {
				button("n", "  New file", "<Cmd>ene<CR>", {}),
				button("o", "  Recents", "<Cmd>:Telescope oldfiles <CR>", {}),
				button("s", "勒" .. " Restore Session", [[:lua require("persistence").load() <cr>]], {}),
				button("u", " PackerSync", "<Cmd>PackerSync<CR>", {}),
				button("q", "  Quit", "<Cmd>qa<CR>", {}),
			}

			local section = {
				header = dashboard.section.header,
				hi_top_section = hi_top_section,
				hi_middle_section = hi_middle_section,
				hi_bottom_section = hi_bottom_section,
				buttons = dashboard.section.buttons,
				footer = dashboard.section.footer,
			}

			--Footer here

			local handle = assert(io.popen("fortune -s"))
			local fortune = handle:read("*all")
			handle:close()
			dashboard.section.footer.val = fortune

			-- ╭──────────────────────────────────────────────────────────╮
			-- │ Setup                                                    │
			-- ╰──────────────────────────────────────────────────────────╯

			local opts = {
				layout = {
					{ type = "padding", val = 1 },
					section.header,
					{ type = "padding", val = 1 },
					section.hi_top_section,
					section.hi_middle_section,
					section.hi_bottom_section,
					{ type = "padding", val = 2 },
					section.buttons,
					{ type = "padding", val = 2 },
					section.footer,
				},
				opts = {
					margin = 5,
				},
			}

			alpha.setup(opts)
		end,
	},

	--Bufferline
	--[[ {
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
	}, ]]

	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",

		config = function()
			require("bufferline").setup({
				options = {
					-- Disable animations (fast!)
					-- Enable/disable auto-hiding the bufferline
					numbers = function(opts)
						return opts.ordinal
					end,
					animation = false,
					auto_hide = false,
					-- Enable/disable current/total tabpages indicator (top right corner)
					tabpages = true,
					-- Enable/disable close button
					closable = false,
					-- Enable/disable icon highlights
					icons = false,
					-- Enable/disable buffer reordering
					-- Enables by default, since it's a requirement for nvim-bufferline.
					-- Pass `nil` to disable (why?).
					reorder = true,
					-- Enable/disable hiding of diagnostic indicator
					-- (Error, Warning, Information)
					diagnostics = "",
					-- Enable/disable maximum padding
					max_name_length = 18,
					-- Enable/disable close icon
					show_close_icon = false,
					show_buffer_close_icons = false,
					-- Enable/disable buffer highlights
					-- Can be: "none", "low", "medium", or "high"
					-- Note: for terminal buffers only "normal" is defined.
					separator_style = "normal",
					-- Add custom separator
					separator = "▎",
					-- Enable/disable custom colors

					-- Enable/disable buffer separator
					-- Can be: "none", "line", "bar", "hollow"
					-- or any string when custom separator specified.
					separator_highlight = "BufferLineSeparator",
					-- Enable/disable buffer icon
					-- Your own option, please specify via `:help bufferline`
					show_buffer_icons = false,
					modified_icon = "[+]",
				},
				highlights = {

					buffer_selected = {
						bold = true,
						italic = false,
					},
					numbers = {},
					numbers_visible = {},
					numbers_selected = {
						bold = true,
						italic = false,
					},

					modified = {
						fg = "#ffffff",
					},
					modified_visible = {
						fg = "#ffffff",
					},
					modified_selected = {
						fg = "#ffffff",
					},
				},
			})
		end,
	},

	--bracket.nvim
	{
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
	},

	--colorizer.nvim
	{
		"NvChad/nvim-colorizer.lua",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			local colorizer = require("colorizer")

			colorizer.setup({
				filetypes = { "*" },
				user_default_options = {
					RGB = true, -- #RGB hex codes
					RRGGBB = true, -- #RRGGBB hex codes
					names = true, -- "Name" codes like Blue or blue
					RRGGBBAA = false, -- #RRGGBBAA hex codes
					AARRGGBB = false, -- 0xAARRGGBB hex codes
					rgb_fn = false, -- CSS rgb() and rgba() functions
					hsl_fn = false, -- CSS hsl() and hsla() functions
					css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
					css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
					-- Available modes for `mode`: foreground, background,  virtualtext
					mode = "background", -- Set the display mode.
					-- Available methods are false / true / "normal" / "lsp" / "both"
					-- True is same as normal
					tailwind = false, -- Enable tailwind colors
					-- parsers can contain values used in |user_default_options|
					sass = { enable = false, parsers = { "css" } }, -- Enable sass colors
					virtualtext = "■",
					-- update color values even if buffer is not focused
					-- example use: cmp_menu, cmp_docs
					always_update = false,
				},
				-- all the sub-options of filetypes apply to buftypes
				buftypes = {},
			})
		end,
	},

	--comment.nvim
	{
		"numToStr/Comment.nvim", -- "gc" to comment visual regions/lines
		event = { "InsertEnter", "CmdlineEnter" },
		config = function()
			local status_ok, comment = pcall(require, "Comment")
			--[[ if not status_ok then
      return
    end ]]

			comment.setup({})
		end,
	},

	--gitsigns.nvim
--[[
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			local gitsigns = require("gitsigns")

			gitsigns.setup({
				signs = {
					add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
					change = {
						hl = "GitSignsChange",
						text = "▎",
						numhl = "GitSignsChangeNr",
						linehl = "GitSignsChangeLn",
					},
					delete = {
						hl = "GitSignsDelete",
						text = "契",
						numhl = "GitSignsDeleteNr",
						linehl = "GitSignsDeleteLn",
					},
					topdelete = {
						hl = "GitSignsDelete",
						text = "契",
						numhl = "GitSignsDeleteNr",
						linehl = "GitSignsDeleteLn",
					},
					changedelete = {
						hl = "GitSignsChange",
						text = "▎",
						numhl = "GitSignsChangeNr",
						linehl = "GitSignsChangeLn",
					},
				},
				attach_to_untracked = false,
				preview_config = {
					-- Options passed to nvim_open_win
					border = "rounded",
					style = "minimal",
					relative = "cursor",
					row = 0,
					col = 1,
				},
			})
		end,
	},
]]
	--competitest.nvim
	{
		"xeluxee/competitest.nvim",
		dependencies = "MunifTanjim/nui.nvim",
		config = function()
			require("competitest").setup({
				runner_ui = {
					interface = "split",
					selector_show_nu = false,
					selector_show_rnu = false,
					show_nu = true,
					show_rnu = false,
					mappings = {
						run_again = "R",
						run_all_again = "<C-r>",
						kill = "K",
						kill_all = "<C-k>",
						view_input = { "i", "I" },
						view_output = { "a", "A" },
						view_stdout = { "o", "O" },
						view_stderr = { "e", "E" },
						toggle_diff = { "d", "D" },
						close = { "q", "Q" },
					},
					viewer = {
						width = 0.5,
						height = 0.5,
						show_nu = true,
						show_rnu = false,
						close_mappings = { "q", "Q" },
					},
				},
				popup_ui = {
					total_width = 0.8,
					total_height = 0.8,
					layout = {
						{
							1,
							{
								{ 1, "so" },
								{ 1, {
									{ 1, "tc" },
									{ 1, "se" },
								} },
							},
						},
						{ 1, {
							{ 1, "eo" },
							{ 1, "si" },
						} },
					},
				},
				split_ui = {
					position = "right",
					relative_to_editor = true,
					total_width = 0.45,
					vertical_layout = {
						{ 0.5, "tc" },
						{ 1.3, { { 1.3, "so" }, { 0.5, "eo" } } },
						{ 1,   { { 0.7, "si" }, { 0.5, "se" } } },
					},
					total_height = 0.4,
					horizontal_layout = {
						{ 2, "tc" },
						{ 3, { { 1, "so" }, { 1, "si" } } },
						{ 3, { { 1, "eo" }, { 1, "se" } } },
					},
				},
				testcases_directory = "./testcases",
				testcases_use_single_file = false,
				testcases_single_file_format = "$(FNOEXT).testcases",
				testcases_input_file_format = "$(FNOEXT)_input$(TCNUM).txt",
				testcases_output_file_format = "$(FNOEXT)_output$(TCNUM).txt",
			})
		end,
	},

	--surround.nvim
	{

		"kylechui/nvim-surround",
		branch = "main", -- Use for stability; omit to use `main` branch for the latest features,
		config = function()
			require("nvim-surround").setup({
				keymaps = {
					insert = "<C-g>s",
					insert_line = "<C-g>S",
					normal = "s",
					normal_cur = "ss",
					normal_line = "S",
					normal_cur_line = "SS",
					visual = "s",
					visual_line = "gS",
					delete = "ds",
					change = "cs",
				},
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},

	{
		'razak17/tailwind-fold.nvim',
		opts = {},
		dependencies = { 'nvim-treesitter/nvim-treesitter' },
		ft = { 'html', 'svelte', 'astro', 'vue', 'typescriptreact', 'php', 'blade','javascriptreact' },
	},



	{ -- Autoformat
		"stevearc/conform.nvim",
		opts = {
			notify_on_error = false,
			format_on_save = function(bufnr)
				-- Disable "format_on_save lsp_fallback" for languages that don't
				-- have a well standardized coding style. You can add additional
				-- languages here or re-enable it for the disabled ones.
				local disable_filetypes = { c = true, cpp = true }
				return {
					timeout_ms = 500,
					lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
				}
			end,
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform can also run multiple formatters sequentially
				python = { "isort", "black" },
				--
				-- You can use a sub-list to tell conform to run *until* a formatter
				-- is found.
				-- javascript = { { "prettierd", "prettier" } },
			},
		},
	},
	--[[ {
		"crispgm/nvim-tabline",
		dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional
		config = function()
			require("tabline").setup({
				show_index = true, -- show tab index
				show_modify = true, -- show buffer modification indicator
				show_icon = false, -- show file extension icon
				fnamemodify = ":t", -- file name modifier
				modify_indicator = "[+]", -- modify indicator
				no_name = "No name", -- no name buffer name
				brackets = { "[", "]" }, -- file name brackets surrounding
				inactive_tab_max_length = 0, -- max length of inactive tab titles, 0 to ignore
			})
		end,
	}, ]]
}
