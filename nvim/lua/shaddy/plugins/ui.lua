return{



  --no neckpain.vnim
  {

    "shortcuts/no-neck-pain.nvim",
    branch = "main",
    config  = function()
      require("no-neck-pain").setup{
        width = 70,  
        relativenumber = true,

      }
    end

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
