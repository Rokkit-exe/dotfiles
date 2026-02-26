return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()

      require("mason-lspconfig").setup({
        -- use lspconfig server names
        ensure_installed = {
          "svelte",
          "html",
          "cssls",
          "ts_ls",
          "gopls",
          "lua_ls",
          "qmlls",
          "clangd",
          "pyright",
          "ruff",
        },
        automatic_installation = true,
      })

      local lspconfig = require("lspconfig")

      local servers =
        { "svelte", "html", "cssls", "ts_ls", "gopls", "lua_ls", "dartls", "qmlls", "clangd", "pyright", "ruff" }

      lspconfig.qmlls.setup({
        cmd = { "/usr/lib/qt6/bin/qmlls" }, -- -E flag is important for older versions
        filetypes = { "qml", "qmljs" },
        root_dir = lspconfig.util.root_pattern(".qmlls.ini", ".git"),
        settings = {},
      })

      lspconfig.clangd.setup({
        cmd = { "clangd", "--background-index" },
        filetypes = { "c", "cpp", "objc", "objcpp" },
        root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
      })

      lspconfig.pyright.setup({
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "basic",
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
            },
          },
        },
      })

      -- Ruff (linting)
      lspconfig.ruff.setup({
        init_options = {
          settings = {
            args = {},
          },
        },
      })

      local function on_attach(_, bufnr)
        local nmap = function(keys, func, desc)
          vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
        end
        nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
        nmap("K", vim.lsp.buf.hover, "Hover Documentation")
        nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
        nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
        nmap("gr", vim.lsp.buf.references, "[G]oto [R]eferences")
        nmap("<leader>f", function()
          vim.lsp.buf.format({ async = true })
        end, "[F]ormat Document")
      end

      for _, server in ipairs(servers) do
        lspconfig[server].setup({
          on_attach = on_attach,
        })
      end
    end,
  },
}
