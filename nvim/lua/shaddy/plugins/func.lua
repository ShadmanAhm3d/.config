return {
	--nvimtree.nvim

	{
		"nvim-tree/nvim-tree.lua",
		keys = {
			{ "<leader>e", "<Cmd>NvimTreeToggle<CR>", desc = "Toggle pin" },
		},
		config = function()
			require("nvim-tree").setup({
				auto_reload_on_write = true,
				view = {
					width = 30,
					side = "left",
					number = false,
					relativenumber = false,
				},
				filters = {
					dotfiles = false,
				},
				renderer = {
					add_trailing = false,
					group_empty = false,
					highlight_git = false,
					full_name = false,
					highlight_opened_files = "none",
					highlight_modified = "none",
					root_folder_label = ":~:s?$?/..?",
					indent_width = 2,

					indent_markers = {
						enable = true, -- enables the tree like line
						inline_arrows = true,
						icons = {
							corner = "└",
							edge = "│",
							item = "│",
							bottom = "─",
							none = " ",
						},
					},

					icons = {
						webdev_colors = true,
						git_placement = "before",
						modified_placement = "after",
						padding = " ",
						symlink_arrow = " ➛ ",
						show = {
							file = true,
							folder = true,
							folder_arrow = true,
							git = true,
							modified = true,
						},

						glyphs = {
							default = "",
							symlink = "",
							bookmark = "",
							modified = "●",
							folder = {
								arrow_closed = "",
								arrow_open = "",
								default = "",
								open = "",
								empty = "",
								empty_open = "",
								symlink = "",
								symlink_open = "",
							},

							git = {
								unstaged = "✗",
								staged = "✓",
								unmerged = "",
								renamed = "➜",
								untracked = "★",
								deleted = "",
								ignored = "◌",
							},
						},
					}, -- end of icons rendering

					special_files = {
						"Cargo.toml",
						"Makefile",
						"README.md",
						"readme.md",
					},
					symlink_destination = true,
				}, -- end of rendering

				ui = {
					confirm = {
						remove = true,
						trash = true,
					},
				},
			})

			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1
		end,
	},

	--[[ {
		"nvim-tree/nvim-tree.lua",
		keys = {
			{ "<leader>e", "<Cmd>NvimTreeToggle<CR>", desc = "Toggle pin" },
		},
		config = function()
			local function my_on_attach(bufnr)
				local api = require("nvim-tree.api")

				local function opts(desc)
					return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
				end

				-- Default mappings. Necessary, unless you want to remove/change all of them.
				api.config.mappings.default_on_attach(bufnr)

				-- Custom mappings
				-- Here you can add/change mappings.
				-- vim.keymap.set("n", "<CR>", api.node.open.tab_drop, opts("Open: New Tab"))
				vim.keymap.set("n", "<CR>", api.node.open.tab, opts("Open: New Tab"))

				-- And you can remove default mappings too.
				vim.keymap.set("n", "<C-t>", api.node.open.edit, opts("Close Directory"))
			end
			require("nvim-tree").setup({
				auto_reload_on_write = true,
				view = {
					width = 30,
					side = "left",
					number = false,
					relativenumber = false,
				},
				filters = {
					dotfiles = true,
				},
				on_attach = my_on_attach,
				renderer = {
					add_trailing = false,
					group_empty = false,
					highlight_git = false,
					full_name = false,
					highlight_opened_files = "none",
					highlight_modified = "none",
					root_folder_label = ":~:s?$?/..?",
					indent_width = 2,

					indent_markers = {
						enable = true, -- enables the tree like line
						inline_arrows = true,
						icons = {
							corner = "└",
							edge = "│",
							item = "│",
							bottom = "─",
							none = " ",
						},
					},

					icons = {
						webdev_colors = true,
						git_placement = "before",
						modified_placement = "after",
						padding = " ",
						symlink_arrow = " ➛ ",
						show = {
							file = true,
							folder = true,
							folder_arrow = true,
							git = true,
							modified = true,
						},

						glyphs = {
							default = "",
							symlink = "",
							bookmark = "",
							modified = "●",
							folder = {
								arrow_closed = "",
								arrow_open = "",
								default = "",
								open = "",
								empty = "",
								empty_open = "",
								symlink = "",
								symlink_open = "",
							},

							git = {
								unstaged = "✗",
								staged = "✓",
								unmerged = "",
								renamed = "➜",
								untracked = "★",
								deleted = "",
								ignored = "◌",
							},
						},
					}, -- end of icons rendering

					special_files = {
						"Cargo.toml",
						"Makefile",
						"README.md",
						"readme.md",
					},
					symlink_destination = true,
				}, -- end of rendering

				ui = {
					confirm = {
						remove = true,
						trash = true,
					},
				},
			})

			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1
		end,
	}, ]]

	--toggleterm.nvim

	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("toggleterm").setup({
				size = 40,
				open_mapping = [[<c-\>]],
				hide_numbers = true,
				shade_terminals = false,
				insert_mappings = true,
				persist_size = true,
				direction = "horizontal",
				close_on_exit = true,
				shell = vim.o.shell,
				autochdir = true,
				highlights = {
					Normal = {
						-- guibg = "#191724",
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
		end,
	},

	--lualine.nvim

	{
		"nvim-lualine/lualine.nvim", -- Fancier statusline
		event = { "WinEnter", "BufWinEnter" },
		config = function()
			-----EVIL LUA ----------
			-- Eviline config for lualine
			-- Author: shadmansaleh
			-- Credit: glepnir
			local lualine = require("lualine")
			-- Color table for highlights
			-- stylua: ignore
			local colors = {
				bg       = '#00ec5f67',
				fg       = '#bbc2cf',
				yellow   = '#ECBE7B',
				cyan     = '#008080',
				darkblue = '#081633',
				green    = '#98be65',
				orange   = '#FF8800',
				violet   = '#a9a1e1',
				magenta  = '#c678dd',
				blue     = '#51afef',
				red      = '#ec5f67',
				black    = '#000000',
			}

			local conditions = {
				buffer_not_empty = function()
					return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
				end,
				hide_in_width = function()
					return vim.fn.winwidth(0) > 80
				end,
				check_git_workspace = function()
					local filepath = vim.fn.expand("%:p:h")
					local gitdir = vim.fn.finddir(".git", filepath .. ";")
					return gitdir and #gitdir > 0 and #gitdir < #filepath
				end,
			}

			-- Config
			local config = {
				options = {
					-- Disable sections and component separators
					globalstatus = true,
					component_separators = "",
					section_separators = "",
					theme = {
						-- We are going to use lualine_c an lualine_x as left and
						-- right section. Both are highlighted by c theme .  So we
						-- are just setting default looks o statusline
						normal = { c = { fg = colors.fg, bg = colors.bg } },
						inactive = { c = { fg = colors.fg, bg = colors.bg } },
					},
					disabled_filetypes = {
						statusline = {},
						winbar = {},
					},
				},
				sections = {
					-- these are to remove the defaults
					lualine_a = {},
					lualine_b = {},
					lualine_y = {},
					lualine_z = {},
					-- These will be filled later
					lualine_c = {},
					lualine_x = {},
				},
				inactive_sections = {
					-- these are to remove the defaults
					lualine_a = {},
					lualine_b = {},
					lualine_y = {},
					lualine_z = {},
					lualine_c = {},
					lualine_x = {},
				},
			}

			local mode_names = {
				["n"] = "NORMAL",
				["no"] = "PENDING",
				["nov"] = "PENDING",
				["noV"] = "PENDING",
				["no\22"] = "PENDING",
				["niI"] = "NORMAL",
				["niR"] = "NORMAL",
				["niV"] = "NORMAL",
				["nt"] = "NORMAL",
				["ntT"] = "NORMAL",
				["v"] = "VISUAL",
				["vs"] = "VISUAL",
				["V"] = "V-LINE",
				["Vs"] = "V-LINE",
				["\22"] = "V-BLOCK",
				["\22s"] = "V-BLOCK",
				["s"] = "SELECT",
				["S"] = "S-LINE",
				["\19"] = "S-BLOCK",
				["i"] = "INSERT",
				["ic"] = "INSERT",
				["ix"] = "INSERT",
				["R"] = "REPLACE",
				["Rc"] = "REPLACE",
				["Rx"] = "REPLACE",
				["Rv"] = "V-REPLACE",
				["Rvc"] = "V-REPLACE",
				["Rvx"] = "V-REPLACE",
				["c"] = "COMMAND",
				["cv"] = "EX",
				["ce"] = "EX",
				["r"] = "REPLACE",
				["rm"] = "MORE",
				["r?"] = "CONFIRM",
				["!"] = "SHELL",
				["t"] = "TERMINAL",
			}
			-- Inserts a component in lualine_c at left section
			local function ins_left(component)
				table.insert(config.sections.lualine_c, component)
			end

			-- Inserts a component in lualine_x ot right section
			local function ins_right(component)
				table.insert(config.sections.lualine_x, component)
			end

			ins_left({
				function()
					return "▊"
				end,
				color = { fg = colors.blue }, -- Sets highlighting of component
				padding = { left = 0, right = 1 }, -- We don't need space before this
			})

			ins_left({
				-- mode component
				function()
					local mode_name = vim.api.nvim_get_mode().mode
					if mode_names[mode_name] == nil then
						return mode_name
					end
					return mode_names[mode_name]
				end,
				color = function()
					-- auto change color according to neovims mode
					local mode_color = {
						n = colors.red,
						i = colors.green,
						v = colors.blue,
						["␖"] = colors.blue,
						V = colors.blue,
						c = colors.magenta,
						no = colors.red,
						s = colors.orange,
						S = colors.orange,
						["␓"] = colors.orange,
						ic = colors.yellow,
						R = colors.violet,
						Rv = colors.violet,
						cv = colors.red,
						ce = colors.red,
						r = colors.cyan,
						rm = colors.cyan,
						["r?"] = colors.cyan,
						["!"] = colors.red,
						t = colors.red,
					}
					return { fg = mode_color[vim.fn.mode()] }
				end,
				padding = { right = 1 },
			})

			ins_left({
				-- filesize component
				"filesize",
				cond = conditions.buffer_not_empty,
			})

			-- ins_left {
			--   'filename',
			--   cond = conditions.buffer_not_empty,
			--   color = { fg = colors.magenta, gui = 'bold' },
			-- }
			--
			ins_left({ "location" })

			ins_left({ "progress", color = { fg = colors.fg, gui = "bold" } })

			ins_left({
				"diagnostics",
				sources = { "nvim_diagnostic" },
				symbols = { error = " ", warn = " ", info = " " },
				diagnostics_color = {
					color_error = { fg = colors.red },
					color_warn = { fg = colors.yellow },
					color_info = { fg = colors.cyan },
				},
			})

			-- Insert mid section. You can make any number of sections in neovim :)
			-- for lualine it's any number greater then 2
			ins_left({
				function()
					return "%="
				end,
			})

			ins_left({
				-- Lsp server name .
				function()
					local msg = "No Active Lsp"
					local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
					local clients = vim.lsp.get_active_clients()
					if next(clients) == nil then
						return msg
					end
					for _, client in ipairs(clients) do
						local filetypes = client.config.filetypes
						if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
							return client.name
						end
					end
					return msg
				end,
				icon = " Server:",
				color = { fg = "#acb0d0", gui = "bold" },
			})

			-- Add components to right sections
			ins_right({
				"o:encoding", -- option component same as &encoding in viml
				fmt = string.upper, -- I'm not sure why it's upper case either ;)
				cond = conditions.hide_in_width,
				color = { fg = colors.green, gui = "bold" },
			})

			ins_right({
				"fileformat",
				fmt = string.upper,
				icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
				color = { fg = colors.blue, gui = "bold" },
			})

			ins_right({
				"branch",
				icon = "",
				color = { fg = colors.violet, gui = "bold" },
			})

			ins_right({
				"diff",
				-- Is it me or the symbol for modified us really weird
				symbols = { added = "🌀 ", modified = "⌨  ", removed = " " },
				diff_color = {
					added = { fg = colors.green },
					modified = { fg = colors.orange },
					removed = { fg = colors.red },
				},
				cond = conditions.hide_in_width,
			})

			ins_right({
				function()
					return "▊"
				end,
				color = { fg = colors.blue },
				padding = { left = 1 },
			})

			-- Now don't forget to initialize lualine
			lualine.setup(config)
		end,
	},

	--telescope.nvim
	{

		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local status_ok, telescope = pcall(require, "telescope")
			if not status_ok then
				return
			end

			local actions = require("telescope.actions")
			-- require('telescope').load_extension('bookmarks')

			vim.keymap.set("n", "<leader>fb", function()
				-- You can pass additional configuration to telescope to change theme, layout, etc.
				require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end, { desc = "[/] Fuzzily search in current buffer]" })
			telescope.setup({
				defaults = {

					prompt_prefix = "🚀 ",
					selection_caret = " ",
					path_display = { "smart" },
					file_ignore_patterns = { ".git/", "node_modules/", "target/" },
					mappings = {
						i = {
							["<C-n>"] = actions.cycle_history_next,
							["<C-p>"] = actions.cycle_history_prev,

							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,

							["<C-c>"] = actions.close,

							["<Down>"] = actions.move_selection_next,
							["<Up>"] = actions.move_selection_previous,

							["<CR>"] = actions.select_default,
							["<C-x>"] = actions.select_horizontal,
							["<C-v>"] = actions.select_vertical,
							["<C-t>"] = actions.select_tab,

							["<C-u>"] = actions.preview_scrolling_up,
							["<C-d>"] = actions.preview_scrolling_down,

							["<PageUp>"] = actions.results_scrolling_up,
							["<PageDown>"] = actions.results_scrolling_down,

							["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
							["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
							["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
							["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
							["<C-l>"] = actions.complete_tag,
							["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
						},

						n = {
							["<esc>"] = actions.close,
							["<CR>"] = actions.select_default,
							["<C-x>"] = actions.select_horizontal,
							["<C-v>"] = actions.select_vertical,
							["<C-t>"] = actions.select_tab,

							["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
							["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
							["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
							["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

							["j"] = actions.move_selection_next,
							["k"] = actions.move_selection_previous,
							["H"] = actions.move_to_top,
							["M"] = actions.move_to_middle,
							["L"] = actions.move_to_bottom,

							["<Down>"] = actions.move_selection_next,
							["<Up>"] = actions.move_selection_previous,
							["gg"] = actions.move_to_top,
							["G"] = actions.move_to_bottom,

							["<C-u>"] = actions.preview_scrolling_up,
							["<C-d>"] = actions.preview_scrolling_down,

							["<PageUp>"] = actions.results_scrolling_up,
							["<PageDown>"] = actions.results_scrolling_down,

							["?"] = actions.which_key,
						},
					},
				},
				pickers = {
					find_files = {
						--previewer = false,
						theme = "dropdown",
					},

					-- Default configuration for builtin pickers goes here:
					-- picker_name = {
					--   picker_config_key = value,
					--   ...
					-- }
					-- Now the picker_config_key will be applied every time you call this
					-- builtin picker
				},
			})
		end,
	},

	-- better diagnostics list and others
	{
		"folke/trouble.nvim",
		cmd = { "TroubleToggle", "Trouble" },
		opts = { use_diagnostic_signs = true },
		keys = {
 			{ "<leader>td", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
			{ "<leader>tx", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
			{ "<leader>tl", "<cmd>TroubleToggle loclist<cr>", desc = "Location List (Trouble)" },
			{ "<leader>tq", "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix List (Trouble)" },
			{
				"[q",
				function()
					if require("trouble").is_open() then
						require("trouble").previous({ skip_groups = true, jump = true })
					else
						local ok, err = pcall(vim.cmd.cprev)
						if not ok then
							vim.notify(err, vim.log.levels.ERROR)
						end
					end
				end,
				desc = "Previous trouble/quickfix item",
			},
			{
				"]q",
				function()
					if require("trouble").is_open() then
						require("trouble").next({ skip_groups = true, jump = true })
					else
						local ok, err = pcall(vim.cmd.cnext)
						if not ok then
							vim.notify(err, vim.log.levels.ERROR)
						end
					end
				end,
				desc = "Next trouble/quickfix item",
			},
		},
	},

	--END
}
