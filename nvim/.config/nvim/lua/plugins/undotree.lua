return {
  "mbbill/undotree",
  lazy = true,
  config = function()
    vim.keymap.set("n", "<leader>U", vim.cmd.UndotreeToggle, { desc = "UndotreeToggle" })
  end,
}
