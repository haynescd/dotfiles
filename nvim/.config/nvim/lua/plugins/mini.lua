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
            -- Simple and easy statusline.
            --  You could remove this setup call if you don't like it,
            --  and try some other statusline plugin
            local statusline = require 'mini.statusline'
            -- set use_icons to true if you have a Nerd Font
            statusline.setup { use_icons = vim.g.have_nerd_font }


            -- You can configure sections in the statusline by overriding their
            -- default behavior. For example, here we set the section for
            -- cursor location to LINE:COLUMN
            ---@diagnostic disable-next-line: duplicate-set-field
            statusline.section_location = function() return '%2l:%-2v' end
            statusline.section_filename = function() return '%f%m%r' end
        end,
    },
}
