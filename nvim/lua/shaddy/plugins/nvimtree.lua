return {
	"nvim-tree/nvim-tree.lua",
	cmd = "NvimTreeToggle",
	tag = "nightly",
	keys = {
		{ "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "NvimTree" },
	},
	config = function()
		local status_ok, nvim_tree = pcall(require, "nvim-tree")
		if not status_ok then
			return
		end
		vim.cmd("highlight NvimTreeNormal guibg='#000' guifg='none' ")
		local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
		if not config_status_ok then
			return
		end

		local tree_cb = nvim_tree_config.nvim_tree_callback

		nvim_tree.setup {
			update_focused_file = {
				enable = true,
				update_cwd = true,
			},

			renderer = {
				root_folder_modifier = ":t",
				icons = {
					glyphs = {
						default = "",
						symlink = "",
						folder = {
							arrow_open = "",
							arrow_closed = "➜",
							default = "",
							open = "",
							empty = "",
							empty_open = "",
							symlink = "",
							symlink_open = "",
						},
						git = {
							unstaged = "U",
							staged = "S",
							unmerged = "",
							renamed = "➜",
							untracked = "UT",
							deleted = "",
							ignored = "◌",
						},
					},
				},
			},
			diagnostics = {
				enable = false,
				show_on_dirs = true,
				icons = {
					hint = "",
					info = "",
					warning = "",
					error = "",
				},
			},
			view = {
				width = 25,
				--    height = 30,
				side = "left",
				mappings = {
					list = {
						{ key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
						{ key = "h", cb = tree_cb "close_node" },
						{ key = "v", cb = tree_cb "vsplit" },
					},
				},
			},

		}

	end
}
