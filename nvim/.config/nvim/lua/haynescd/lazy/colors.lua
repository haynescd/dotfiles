function ColorMyPencils(color)
    color = color or "rose-pine"
    vim.cmd.colorscheme(color)

    --vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    --vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

-- lua/plugins/rose-pine.lua
return {
    --{
    --    "rose-pine/neovim",
    --    name = "rose-pine",
    --    config = function()
    --        require('rose-pine').setup({
    --            variant = "moon",
    --            dark_variant = "moon",
    --            disable_background = true,
    --            styles = {
    --                italic = true,
    --            },
    --        })
    --        ColorMyPencils();
    --    end
    --},
    {
        "catppuccin/nvim",
        name = "catppuccin",
        config = function()
            require('catppuccin').setup({
                flavour = "macchiato",
                transparent_background = true,
                no_underline = true,
                dim_inactive = {
                    enabled = true, -- dims the background color of inactive window
                    shade = "dark",
                    percentage = 0.15, -- percentage of the shade to apply to the inactive window
                },
            })
            ColorMyPencils('catppuccin');
        end
    }

}
