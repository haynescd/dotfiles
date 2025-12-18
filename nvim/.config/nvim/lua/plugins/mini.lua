return {
    {
        "echasnovski/mini.nvim",
        config = function()
            require("mini.ai").setup()
            require("mini.surround").setup()

            local indentscope = require("mini.indentscope")
            indentscope.setup({
                symbol = "│",
            })
            indentscope.gen_animation.none()
            local hipatterns = require("mini.hipatterns")
            hipatterns.setup({
                highlighters = {
                    hex_color = hipatterns.gen_highlighter.hex_color(),
                },
            })
        end,
    },
}
