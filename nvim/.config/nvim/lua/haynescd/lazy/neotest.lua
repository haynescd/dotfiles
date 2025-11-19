return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-neotest/neotest-python",
        "nvim-neotest/neotest-plenary",
        "nvim-neotest/neotest-vim-test",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
    },
    opts = {},
    config = function()
        local neotest = require("neotest")
        neotest.setup({
            adapters = {
                require("neotest-python")({
                    dap = { justMyCode = false },
                }),
                require("neotest-plenary"),
            },
        })

        -- Run nearest test
        vim.keymap.set("n", "<leader>tn", function()
            neotest.run.run()
        end, { desc = "Run nearest test" })
        -- Run all test in file
        vim.keymap.set("n", "<leader>tf", function()
            neotest.run.run(vim.fn.expand("%"))
        end, { desc = "Running all test in current file" })
        -- Debug nearest test
        vim.keymap.set("n", "<leader>td", function()
            neotest.run.run({ strategy = "dap", suite = false })
        end, { desc = "Debug nearest test" })
        -- Toggle Output Panel
        vim.keymap.set("n", "<leader>to", function()
            neotest.output_panel.toggle()
        end, { desc = "Toggle Test Output Panel" })
        -- Toggle Test Summary
        vim.keymap.set("n", "<leader>ts", function()
            neotest.summary.toggle()
        end, { desc = "Toggle Test Summary" })
    end,
}
