-- add pyright to lspconfig
return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      diagnostics = {
        signs = false,
      },
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        basedpyright = {
          settings = {
            pyright = {
              disableOrganizeImports = true,
              anaylsis = {
                autoImportCompletions = true,

                inlayHints = {
                  callArgumentNames = true,
                },
              },
            },
            python = {
              analysis = {
                -- Ignore all files for analysis to exclusively use Ruff for linting
                ignore = { "*" },
              },
            },
          },
        },
        ruff = {
          init_options = {
            settings = {
              lineLength = 80,
              -- Ruff language server settings go here
            },
          },
        },
        terraformls = {},
        jdtls = {
          settings = {
            java = {
              maven = {
                downloadSources = true,
              },
              import = {
                maven = {
                  enabled = true,
                },
                exclusions = {
                  "**/node_modules/**",
                  "**/.metadata/**",
                  "**/archetype-resources/**",
                  "**/META-INF/maven/**",
                  "/**/test/**",
                },
              },
              referencesCodeLens = {
                enabled = true,
              },
              signatureHelp = {
                enabled = true,
              },
              implementationsCodeLens = {
                enabled = true,
              },
              format = {
                enabled = true,
              },
              saveActions = {
                organizeImports = true,
              },
              autobuild = {
                enabled = true,
              },
            },
          },
        },
      },
    },
  },
}
