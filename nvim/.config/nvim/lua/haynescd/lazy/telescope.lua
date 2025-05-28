return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.8",

    dependencies = {
        "nvim-lua/plenary.nvim",
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },

    config = function()
        require('telescope').setup({
            defaults = {
                theme = "ivy"
            },
            pickers = {
                find_files = {
                    theme = "ivy"
                },
                git_files = {
                    theme = "ivy"
                },
            },
            extensions = {
                fzf = {}
            }
        })

        require('telescope').load_extension('fzf')

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>fd', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fp', builtin.git_files, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers)
        vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find)
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        vim.keymap.set('n', '<leader>gw', builtin.live_grep, {})

        vim.keymap.set('n', '<leader>en', function()
            require('telescope.builtin').find_files {
                cwd = vim.fn.stdpath("config")
            }
        end)
        vim.keymap.set('n', '<leader>ep', function()
            require('telescope.builtin').find_files {
                cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
            }
        end)
        vim.keymap.set("n", "<leader>fg", require "config.telescope.multigrep")
    end
}
