require("nvim-treesitter.config").setup {
    ensure_installed = {
        "bash",
        "c",
        "diff",
        "glsl",
        "html",
        "java",
        "lua",
        "luadoc",
        "markdown",
        "markdown_inline",
        "query",
        "vim",
        "vimdoc",
    },
    auto_install = true,
    highlight = {
        enable = true,
    },
}
