-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")


vim.keymap.set("n", "<A-j>", "<CMD>cnext<CR>", { desc = "Queue List Next" })
vim.keymap.set("n", "<A-k>", "<CMD>cprev<CR>", { desc = "Queue List Prev" })
vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>")

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "<leader>cb", function()
    local bufs = vim.api.nvim_list_bufs()
    local current_buf = vim.api.nvim_get_current_buf()
    for _, b in ipairs(bufs) do
        if b ~= current_buf then
            vim.api.nvim_buf_delete(b, {})
        end
    end
end, { desc = "Clear all other Buffers" })
