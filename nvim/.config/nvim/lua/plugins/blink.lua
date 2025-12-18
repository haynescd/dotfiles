return {
    {
        "saghen/blink.cmp",
        -- optional: provides snippets for the snippet source
        dependencies = { "rafamadriz/friendly-snippets" },
        -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
        version = "1.*",
        -- If you use nix, you can build from source using latest nightly rust with:
        -- build = 'nix run .#build-plugin',

        event = "VeryLazy",
        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            completion = {
                list = {
                    selection = { preselect = false, auto_insert = true },
                },
                documentation = { auto_show = true },
                ghost_text = { enabled = true },
            },
            signature = { enabled = true },
            fuzzy = { implementation = "prefer_rust_with_warning" },
        },
        opts_extend = { "sources.default" },
    },
}
