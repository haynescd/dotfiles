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
        --lazy = true,
        name = "catppuccin",
        priority = 1000,
        config = function()
            require('catppuccin').setup({
                flavour = "macchiato",
                transparent_background = true,
                no_underline = true,
                dim_inactive = {
                    enabled = true,    -- dims the background color of inactive window
                    shade = "dark",
                    percentage = 0.15, -- percentage of the shade to apply to the inactive window
                },
            })
            ColorMyPencils('catppuccin');
        end,
        integrations = {
            aerial = true,
            alpha = true,
            cmp = true,
            dashboard = true,
            flash = true,
            fzf = true,
            grug_far = true,
            gitsigns = true,
            headlines = true,
            illuminate = true,
            indent_blankline = { enabled = true },
            leap = true,
            lsp_trouble = true,
            mason = true,
            mini = true,
            navic = { enabled = true, custom_bg = "lualine" },
            neotest = true,
            neotree = true,
            noice = true,
            notify = true,
            snacks = true,
            telescope = true,
            treesitter_context = true,
            which_key = true,
        },
    }

}
