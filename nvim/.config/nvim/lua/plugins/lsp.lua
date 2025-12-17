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
            basedpyright = {
              disableOrganizeImports = true,
              anaylsis = {
                autoImportCompletions = true,
                inlayHints = {
                  callArgumentNames = true,
                },
                ignore = { "*" },
                typeCheckingMode = "basic",
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
    -- you can do any additional lsp server setup here
    -- return true if you don't want this server to be setup with lspconfig
    ---@type table<string, fun(server:string, opts: vim.lsp.Config):boolean?>
    setup = {
      ruff = function()
        Snacks.util.lsp.on({ name = "ruff" }, function(_, client)
          -- Disable hover in favor of Pyright
          client.server_capabilities.hoverProvider = false
        end)
      end,
      -- example to setup with typescript.nvim
      -- tsserver = function(_, opts)
      --   require("typescript").setup({ server = opts })
      --   return true
      -- end,
      -- Specify * to use this function as a fallback for any server
      -- ["*"] = function(server, opts) end,
    },
  },
}
