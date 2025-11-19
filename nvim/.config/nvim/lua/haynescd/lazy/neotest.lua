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
		vim.keymap.set("n", "<leader>t", function()
			neotest.run.run()
		end)
	end,
}
