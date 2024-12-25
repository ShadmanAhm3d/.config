return {




 --[[ {
 "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path", -- source for file system paths
    "L3MON4D3/LuaSnip", -- snippet engine
    "saadparwaiz1/cmp_luasnip", -- for autocompletion
    "rafamadriz/friendly-snippets", -- useful snippets
    "onsails/lspkind.nvim", -- vs-code like pictograms
  },
  config = function()
    local cmp = require("cmp")

    local luasnip = require("luasnip")

    local lspkind = require("lspkind")

    -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
      require("luasnip.loaders.from_snipmate").lazy_load { paths = vim.fn.stdpath "config" .. "/snippets/snipmate" }
      require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = { -- configure how nvim-cmp interacts with snippet engine
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<C-e>"] = cmp.mapping.abort(), -- close completion window
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
      }),
      -- sources for autocompletion
        
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" }, -- snippets
        { name = "buffer" }, -- text within current buffer
        { name = "path" }, -- file system paths
      }),
      -- configure lspkind for vs-code like pictograms in completion menu
      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50,
          ellipsis_char = "...",
        }),
      },
    })
  end,
  },




]]




  --cmp

  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "hrsh7th/cmp-buffer",       -- Buffer Completions
      "hrsh7th/cmp-path",         -- Path Completions
      {
        "saadparwaiz1/cmp_luasnip", -- Snippet Completions
        event = { "InsertEnter" },
      },
      "hrsh7th/cmp-nvim-lsp",       -- LSP Completions
      "hrsh7th/cmp-nvim-lua",       -- Lua Completions
      "hrsh7th/cmp-cmdline",        -- CommandLine Completions
      "L3MON4D3/LuaSnip",           -- Snippet Engine
      "rafamadriz/friendly-snippets", -- Bunch of Snippets
      {
        "windwp/nvim-autopairs",
        config = function()
          local autopairs = require "nvim-autopairs"

          autopairs.setup {
            check_ts = true, -- treesitter integration
            disable_filetype = { "TelescopePrompt" },
          }

          local cmp_autopairs = require "nvim-autopairs.completion.cmp"
          local cmp_status_ok, cmp = pcall(require, "cmp")
          if not cmp_status_ok then
            return
          end
          cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done {})
        end,
      },
    },
    config = function()
      local cmp = require "cmp"
      local luasnip = require "luasnip"

      require("luasnip.loaders.from_snipmate").lazy_load { paths = vim.fn.stdpath "config" .. "/snippets/snipmate" }
      require("luasnip.loaders.from_vscode").lazy_load()
      -- require("luasnip.loaders.from_vscode").lazy_load { paths = vim.fn.stdpath "config" .. "/snippets/vscode" }
      require'luasnip'.filetype_extend("javascript", {"html"})

      local kind_icons = {
        Text = "",
        Method = "",
        Function = "",
        Constructor = "",
        Field = "ﰠ",
        Variable = "",
        Class = "ﴯ",
        Interface = "",
        Module = "",
        Property = "ﰠ",
        Unit = "塞",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Struct = "פּ",
        Event = "",
        Operator = "",
        TypeParameter = "",
      }

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
          end,
        },

        mapping = cmp.mapping.preset.insert {
          ["<C-k>"] = cmp.mapping.select_prev_item(),
          ["<C-j>"] = cmp.mapping.select_next_item(),
          ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1)),
          ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1)),
          ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
          ["<C-e>"] = cmp.mapping {
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
          },
          -- Accept currently selected item. If none selected, `select` first item.
          -- Set `select` to `false` to only confirm explicitly selected items.
          ["<CR>"] = cmp.mapping.confirm { select = false },
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expandable() then
              luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, {
            "i",
            "s",
          }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, {
            "i",
            "s",
          }),
        },
        formatting = {
          format = function(_, vim_item)
            vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
            return vim_item
          end,
        },
        sources = {
          { name = "nvim_lsp" },
--[[           { name = "nvim_lua" }, ]]
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        },
        confirm_opts = {
          behavior = cmp.ConfirmBehavior.Replace,
          select = false,
        },
  -- Set minimum keyword length for auto-completion
      completion = {
        keyword_length = 2,
      },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
          border = "single"
        },
        experimental = {
          ghost_text = true,
        },
      }

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "cmdline" },
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        formatting = {
          -- fields = { 'abbr' },
          format = function(_, vim_item)
            vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
            return vim_item
          end,
        },
      })
    end,

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









  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "RRethy/nvim-treesitter-textsubjects",
      "nvim-treesitter/nvim-treesitter-textobjects",

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
          "ts_ls",
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
