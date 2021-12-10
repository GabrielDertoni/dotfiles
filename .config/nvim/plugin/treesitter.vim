

lua << EOF

require 'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        disable = {},
    },
    indent = {
        enable = false,
        disable = {},
    },
    ensure_installed = {
        "tsx",
        "toml",
        "json",
        "yaml",
        "html",
        "css",
        "vue",
        "go",
        "rust",
        "c",
        "cpp",
        "python"
    }
}

require 'nvim-treesitter.highlight'
local hlmap = vim.treesitter.highlighter.hl_map

hlmap["keyword.operator"] = "Keyword"

EOF
