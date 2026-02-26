-- ~/.config/nvim/lua/plugins/formatting.lua
return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    config = function()
      require("conform").setup({
        format_on_save = {
          timeout_ms = 500,
          lsp_fallback = true,
        },
        formatters_by_ft = {
          python = { "black" },
        },
      })
    end,
    opts = {
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        svelte = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        dart = { "dart_format" },
        qml = { "prettier" },
      },
    },
  },
}
