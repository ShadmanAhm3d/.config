return {
    { "shaunsingh/oxocarbon.nvim" },
    {
        "rose-pine/neovim",
        config = function()
            require('rose-pine').setup({
                dark_variant = 'main',
                disable_float_background = false,
                disable_italics = true,
            })
        end,
    },
    {
        'ofirgall/ofirkai.nvim',
        config = function()
            require('ofirkai').setup {
                scheme = require('ofirkai').scheme,
                custom_hlgroups = {},
                remove_italics = false,
            }
        end,
    },
    {
        "BeardedBear/bearded-theme",
 
    },
}
