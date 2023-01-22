return {
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
    local config_dir = fn.stdpath('config')

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ Header                                                   │
    -- ╰──────────────────────────────────────────────────────────╯

    local header = {
      [[ _______             ____   ____.__]],
      [[ \      \   ____  ___\   \ /   /|__| _____]],
      [[ /   |   \_/ __ \/  _ \   Y   / |  |/     \]],
      [[/    |    \  ___(  <_> )     /  |  |  Y Y  \]],
      [[\____|__  /\___  >____/ \___/   |__|__|_|  /]],
      [[        \/     \/                        \/]],

    }

    dashboard.section.header.type = "text";
    dashboard.section.header.val = header;
    dashboard.section.header.opts = {
      position = "center",
      hl = "Normal",
    }

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ Heading Info                                             │
    -- ╰──────────────────────────────────────────────────────────╯

    local thingy = io.popen('echo "$(date +%a) $(date +%d) $(date +%b)" | tr -d "\n"')
    if thingy == nil then return end
    local date = thingy:read("*a")
    thingy:close()

    local datetime = os.date " %H:%M"

    local hi_top_section = {
      type = "text",
      val = "╭────────────   Today is " .. date .. " ────────────╮", opts = {
        position = "center",
        hl = "Normal"
      }
    }

    local hi_middle_section = {
      type = "text",
      val = "│                                                │",
      opts = {
        position = "center",
        hl = "Normal"
      }
    }

    local hi_bottom_section = {
      type = "text",
      val = "╰───══───══───══───  " .. datetime .. "  ───══───══───══────╯",
      opts = {
        position = "center",
        hl = "Normal"
      }
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
        keybind_opts = if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
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

    local handle = assert(io.popen('fortune -s'))
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
        margin = 5
      },
    }

    alpha.setup(opts)
  end,
}
