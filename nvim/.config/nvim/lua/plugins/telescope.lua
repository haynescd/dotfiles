return {
    "nvim-telescope/telescope.nvim",
    event = "VeryLazy",

    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },

    config = function()
        require("telescope").setup({
            defaults = {
                pickers = {
                    theme = "ivy",
                },
            },
            pickers = {
                theme = "ivy",
                find_files = {
                    theme = "ivy",
                },
                git_files = {
                    theme = "ivy",
                },
            },
            extensions = {
                fzf = {},
            },
        })

        pcall(require("telescope").load_extension, "fzf")
        pcall(require("telescope").load_extension, "ui-select")

        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>fd", builtin.find_files, { desc = "Find Files" })
        vim.keymap.set("n", "<leader>fp", builtin.git_files, { desc = "Find (GIT) Files" })
        vim.keymap.set("n", "<leader>fb", builtin.buffers)
        vim.keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find)
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help Tags" })
        vim.keymap.set("n", "<leader>gw", builtin.grep_string)
        vim.keymap.set("n", "<leader>gs", builtin.live_grep, { desc = "Live Grep" })

        vim.keymap.set("n", "<leader>en", function()
            require("telescope.builtin").find_files({
                cwd = vim.fn.stdpath("config"),
            })
        end)
        vim.keymap.set("n", "<leader>ep", function()
            require("telescope.builtin").find_files({
                cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy"),
            })
        end)
    end,
}
