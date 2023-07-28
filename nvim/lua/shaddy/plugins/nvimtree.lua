return{
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    config = function()
        require("neo-tree").setup{
            git_status = {
                symbol = false,
            }
        }
    end

}
