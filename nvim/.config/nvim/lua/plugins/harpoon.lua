return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = true,
    opts = {
      menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
      },
      settings = {
        save_on_toggle = true,
      },
    },
    keys = function()
      local harpoon = require("harpoon")
      local keys = {
        {
          "<leader>a",
          function()
            harpoon:list():add()
          end,
          desc = "Harpoon Add",
        },
        {
          "<leader>e",
          function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
          end,
          desc = "Harpoon Quick Menu",
        },
        {
          "<C-h>",
          function()
            harpoon:list():select(1)
          end,
          "Harpoon select 1",
        },
        {
          "<C-j>",
          function()
            harpoon:list():select(2)
          end,
          "Harpoon select 2",
        },
        {
          "<C-k>",
          function()
            harpoon:list():select(3)
          end,
          "Harpoon select 3",
        },
        {
          "<C-l>",
          function()
            harpoon:list():select(4)
          end,
          "Harpoon select 4",
        },
      }
      return keys
    end,
  },
}
