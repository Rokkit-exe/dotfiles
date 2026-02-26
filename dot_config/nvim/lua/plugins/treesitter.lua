return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "tsx",
        "typescript",
        "go",
        "dart",
        "lua",
        "python",
        "bash",
        "html",
        "javascript",
        "json",
        "markdown",
        "markdown_inline",
        "yaml",
        "qmljs",
      },
      highlight = { enable = true },
      indent = { enable = true },
    },
  },
}
