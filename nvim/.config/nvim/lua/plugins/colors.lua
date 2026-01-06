function ColorMyPencils(color)
    color = color or "rose-pine"
    vim.cmd.colorscheme(color)

    --vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    --vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

function transparency()
    -- transparent background
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
    vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })
    vim.api.nvim_set_hl(0, "Terminal", { bg = "none" })
    vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
    vim.api.nvim_set_hl(0, "FoldColumn", { bg = "none" })
    vim.api.nvim_set_hl(0, "Folded", { bg = "none" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    vim.api.nvim_set_hl(0, "WhichKeyFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopePromptTitle", { bg = "none" })


    -- transparent notify background
    vim.api.nvim_set_hl(0, "NotifyINFOBody", { bg = "none" })
    vim.api.nvim_set_hl(0, "NotifyERRORBody", { bg = "none" })
    vim.api.nvim_set_hl(0, "NotifyWARNBody", { bg = "none" })
    vim.api.nvim_set_hl(0, "NotifyTRACEBody", { bg = "none" })
    vim.api.nvim_set_hl(0, "NotifyDEBUGBody", { bg = "none" })
    vim.api.nvim_set_hl(0, "NotifyINFOTitle", { bg = "none" })
    vim.api.nvim_set_hl(0, "NotifyERRORTitle", { bg = "none" })
    vim.api.nvim_set_hl(0, "NotifyWARNTitle", { bg = "none" })
    vim.api.nvim_set_hl(0, "NotifyTRACETitle", { bg = "none" })
    vim.api.nvim_set_hl(0, "NotifyDEBUGTitle", { bg = "none" })
    vim.api.nvim_set_hl(0, "NotifyINFOBorder", { bg = "none" })
    vim.api.nvim_set_hl(0, "NotifyERRORBorder", { bg = "none" })
    vim.api.nvim_set_hl(0, "NotifyWARNBorder", { bg = "none" })
    vim.api.nvim_set_hl(0, "NotifyTRACEBorder", { bg = "none" })
    vim.api.nvim_set_hl(0, "NotifyDEBUGBorder", { bg = "none" })
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
        lazy = false,
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "macchiato",
                transparent_background = true,
                no_underline = true,
                dim_inactive = {
                    enabled = true,    -- dims the background color of inactive window
                    shade = "dark",
                    percentage = 0.15, -- percentage of the shade to apply to the inactive window
                },
            })
            ColorMyPencils("catppuccin")
            transparency()
        end,
    },
}
