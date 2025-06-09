return {
  "williamboman/mason.nvim",
  cmd = "Mason",
  build = ":MasonUpdate",
  opts = {
    ui = {
      border = "rounded",
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
    max_concurrent_installers = 4,
    ensure_installed = {
      -- lua tools
      "stylua",
      "lua-language-server",
      "shellcheck",
      "shfmt",
      "flake8",
      "hadolint",
      -- go tools
      "go-debug-adapter",
      "gofumpt",
      "goimports",
      "gopls",
      -- python tools
      "pylint",
      "ruff",
      -- javascript/typescript tools
      "typescript-language-server",
      "eslint-lsp",
      "deno",
      -- json tools
      "js-debug-adapter",
      "jsonnet-language-server",
      -- markdown tools
      "marksman",
      -- sql tools
      "sqlfluff",
    },
  },
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "williamboman/mason-null-ls.nvim",
  },
}
