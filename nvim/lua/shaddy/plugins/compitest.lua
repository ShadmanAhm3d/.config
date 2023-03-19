return {
  'xeluxee/competitest.nvim',
  dependencies = 'MunifTanjim/nui.nvim',
  config = function()

    require 'competitest'.setup({
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
          { 1, {
            { 1, "so" },
            { 1, {
              { 1, "tc" },
              { 1, "se" },
            } },
          } },
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
          { 1, { { 0.7, "si" }, { 0.5, "se" } } },
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

  end
}
