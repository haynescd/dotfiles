return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "ruff_organize_imports", "ruff_format" },
        java = { "google-java-format" },
        terraform = { "terraform_fmt" },
        lua = { "stylua" },
      },
      --format_on_save = { timeout_ms = 500 },
      formatters = {
        ruff_format = {
          append_args = { "--line-length", 80 },
        },
      },
    },
  },
}
