-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<A-j>", "<CMD>cnext<CR>", { desc = "Queue List Next" })
vim.keymap.set("n", "<A-k>", "<CMD>cprev<CR>", { desc = "Queue List Prev" })

-- Toggle Inlay Hints
vim.keymap.set("n", "<leader>tt", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
  end,
  { desc = "Toggle Inlay hints" }
)
