return {
    {
        dir = "~/code/plugins/present.nvim/",
        enabled = false,
        config = function()
            require("present")
        end,
    },
    {
        dir = "~/code/projects/lazymd",
        build = "cargo build --release",

        keys = {
            { "<leader>md", "<cmd>Lazymd<cr>", desc = "Lazymd" },
        },
        opts = {},
        enabled = true,
    },
}
