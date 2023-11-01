return{

  --lspzero.nvim
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    -- LSP Support
    dependencies = {
      'neovim/nvim-lspconfig', -- Required
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim', -- Optional
      {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
          "jose-elias-alvarez/null-ls.nvim",
        },
      },
    },

    config = function()
      local lsp = require("lsp-zero")
      local mason_null_ls = require("mason-null-ls")
      local mason = require("mason")
      lsp.preset("recommended")

      lsp.ensure_installed({
        'lua_ls',
      })

      --[[ lsp.css_lsp.setup{
        autostart = true,
        filetypes = {
          "css", "scss", "less" ,
        }
      } ]]
      -- Fix Undefined global 'vim'
      lsp.configure('lua_ls', {
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' }
            }
          }
        }
      })

      mason.setup({
        ui = {
          border = "rounded",
        }
      })


      lsp.set_preferences({
        suggest_lsp_servers = false,
        sign_icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      })

      lsp.on_attach(function(client, bufnr)
        local opts = { buffer = bufnr, remap = false }

        if client.name == "eslint" then
          vim.cmd.LspStop('eslint')
          return
        end

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "mp", "<cmd>Lspsaga outline<CR>", opts) --saga
        vim.keymap.set("n", "<leader>fi", "<cmd>Lspsaga lsp_finder<CR>", opts) --saga
        vim.keymap.set("n", "K", "<cmd>Lspsaga peek_definition<CR>", opts) --saga
        vim.keymap.set("n", "<leader>a", "<cmd>Lspsaga show_buf_diagnostics<CR> ", opts) --saga
        vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_next<CR> ", opts) --saga
        vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_prev<CR> ", opts) --saga
        vim.keymap.set("n", "<F6>", "<cmd>Lspsaga code_action<CR> ", opts)
        vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>q", vim.lsp.buf.rename, opts)
        vim.keymap.set("i", "<C-h>", vim.diagnostic.setloclist, opts)
        vim.cmd [[ command! Format execute 'lua vim.lsp.buf.format { async = true}' ]]
      end)

      lsp.setup()
      --Mason for formatting
      mason_null_ls.setup({
        ensure_installed = {
          "prettier"
        }
      })

      --diagnostics on line
      vim.diagnostic.config({
        virtual_text = true,
      })
    end

  },





  --lspsaga.nvim

  {
    "glepnir/lspsaga.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      local lspsaga = require "lspsaga"

      lspsaga.setup {
        preview = {
          lines_above = 0,
          lines_below = 10,
        },

        code_action = {
          num_shortcut = true,
          keys = {
            quit = ";",
            exec = "<CR>",
          },
        },

        scroll_preview = {
          scroll_down = "<C-f>",
          scroll_up = "<C-b>",
        },
        request_timeout = 2000,

        lightbulb = {
          enable = false,
          enable_in_insert = true,
          sign = true,
          sign_priority = 40,
          virtual_text = true,
        },

        rename = {
          quit = ";",
          exec = "<CR>",
          in_select = false,
        },

        finder = {
          edit = { "o", "<CR>" },
          vsplit = "s",
          split = "i",
          tabe = "t",
          quit = { ";", "<ESC>" },
        },
        diagnostic = {
          twice_into = false,
          show_code_action = true,
          show_source = true,
          keys = {
            exec_action = "o",
            quit = ";",
          },
        },

        symbol_in_winbar = {
          enable = false,
          separator = "  ",
          hide_keyword = true,
          show_file = true,
          folder_level = 2,
        },

        definition = {
          edit = "<C-c>o",
          vsplit = "<C-c>v",
          split = "<C-c>i",
          tabe = "<C-c>t",
          quit = ";",
          close = "<Esc>",
        },

        ui = {
          theme = "round",
          border = "rounded",
          winblend = 0,
          expand = "",
          collaspe = "",
          preview = " ",
          code_action = "💡",
          diagnostic = "🐞",
          incoming = " ",
          outgoing = " ",
          colors = {
            --float window normal bakcground color
            normal_bg = "NONE",
            --title background color
            title_bg = "#AAAAAA",
            red = "#db4b4b",
            magenta = "#BB9AF7",
            orange = "#D19A66",
            yellow = "#ECBE7B",
            green = "#98be65",
            cyan = "#7dcfff",
            blue = "#7AA2F7",
            purple = "#a9a1e1",
            white = "#bbc2cf",
            black = "#1a1b26",
          },
          kind = {},
        },

        outline = {
          win_position = "right",
          win_with = "",
          win_width = 30,
          show_detail = true,
          auto_preview = true,
          auto_refresh = true,
          auto_close = true,
          custom_sort = nil,
          keys = {
            jump = "o",
            expand_collaspe = "u",
            quit = ";",
          },
        },

        callhierarchy = {
          show_detail = false,
          keys = {
            edit = "e",
            vsplit = "s",
            split = "i",
            tabe = "t",
            jump = "o",
            quit = ";",
            expand_collaspe = "u",
          },
        },
      }
    end,

  },




  --[[ --treesitter.nvim
  

  {
    "nvim-treesitter/nvim-treesitter",
    module = true,
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
      -- Active indent guide and indent text objects. When you're browsing
      -- code, this highlights the current level of indentation, and animates
      -- the highlighting.
      {
        "echasnovski/mini.indentscope",
        version = false, -- wait till new 0.7.0 release to put it back on semver
        event = { "BufReadPre", "BufNewFile" },
        opts = {
          -- symbol = "▏",
          symbol = "│",
          options = { try_as_border = true },
        },
        init = function()
          vim.api.nvim_create_autocmd("FileType", {
            pattern = {
              "help",
              "alpha",
              "dashboard",
              "neo-tree",
              "Trouble",
              "lazy",
              "mason",
              "notify",
              "toggleterm",
              "lazyterm",
            },
            callback = function()
              vim.b.miniindentscope_disable = true
            end,
          })
        end,
      },
      {
        "HiPhish/nvim-ts-rainbow2",
      },

    },
    build = ":TSUpdate",
    config = function()
      local configs = require "nvim-treesitter.configs"

      configs.setup {
        ensure_installed = { "lua"  }, -- one of "all" or a list of languages
        highlight = {
          enable = true, -- false will disable the whole extension
          disable = { "css" }, -- list of language that will be disabled
        },
        autopairs = {
          enable = true,
        },

        rainbow = {
          enable = true,
          -- list of languages you want to disable the plugin for
          disable = { },
          -- Which query to use for finding delimiters
          -- query = 'rainbow-parens',
          -- Highlight the entire buffer all at once
          strategy = require('ts-rainbow').strategy.global,
        },
        indent = { enable = false, disable = {} },
        playground = {
          enable = true,
          disable = {},
          updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
          -- persist_queries = false, -- Whether the query persists across vim sessions
          keybindings = {
            -- toggle_query_editor = "o",
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

]]

 {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"RRethy/nvim-treesitter-textsubjects",
		"nvim-treesitter/nvim-treesitter-textobjects",

    {
      "echasnovski/mini.indentscope",
      version = false, -- wait till new 0.7.0 release to put it back on semver
      event = { "BufReadPre", "BufNewFile" },
      opts = {
        -- symbol = "▏",
        symbol = "│",
        options = { try_as_border = true },
      },
      init = function()
        vim.api.nvim_create_autocmd("FileType", {
          pattern = {
            "help",
            "alpha",
            "dashboard",
            "neo-tree",
            "Trouble",
            "lazy",
            "mason",
            "notify",
            "toggleterm",
            "lazyterm",
          },
          callback = function()
            vim.b.miniindentscope_disable = true
          end,
        })
      end,
    },
  },
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		---@diagnostic disable-next-line
		treesitter.setup({
			ensure_installed = {
				"bash",
				"css",
				"cpp",
				"graphql",
				"html",
				"javascript",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"regex",
				"tsx",
				"typescript",
			},
			highlight = {
				enable = true,
			},
			match = {
				enable = true,
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "zi",
					node_incremental = "zi",
					scope_incremental = "zo",
					node_decremental = "zd",
				},
			},
			indent = {
				enable = true,
			},
			-- textobjects = {
			--   select = {
			--     enable = true,
			--     lookahead = true,
			--     keymaps = {
			--       ["af"] = "@function.outer",
			--       ["if"] = "@function.inner",
			--       ["ac"] = "@class.outer",
			--       ["ic"] = "@class.inner",
			--
			--       -- xml attribute
			--       ["ax"] = "@attribute.outer",
			--       ["ix"] = "@attribute.inner",
			--
			--       -- json
			--       ["ak"] = "@key.outer",
			--       ["ik"] = "@key.inner",
			--       ["av"] = "@value.outer",
			--       ["iv"] = "@value.inner",
			--     },
			--   },
			swap = {
				enable = true,
				swap_next = {
					["<leader>rp"] = "@parameter.inner",
				},
				swap_previous = {
					["<leader>rP"] = "@parameter.inner",
				},
			},
			textsubjects = {
				enable = true,
				keymaps = {
					["."] = "textsubjects-smart",
					[";"] = "textsubjects-container-outer",
					["i;"] = "textsubjects-container-inner",
				},
			},
		})



	end,
	build = function()
		vim.cmd [[TSUpdate]]
	end,
}


}
