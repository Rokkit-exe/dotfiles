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

      lspconfig.pyright.setup({
        on_attach = on_attach,
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "basic",
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              -- This helps recognize libraries in your venv
              diagnosticMode = "workspace",
            },
          },
        },
      })

      -- Ruff (linting)
      lspconfig.ruff.setup({
        on_attach = function(client, bufnr)
          client.server_capabilities.hoverProvider = false
          on_attach(client, bufnr)
        end,
      })

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

      -- 4. Generic servers loop (Only for servers NOT configured above)
      local generic_servers = { "svelte", "html", "cssls", "ts_ls", "gopls", "lua_ls" }
      for _, server in ipairs(generic_servers) do
        lspconfig[server].setup({
          on_attach = on_attach,
        })
      end

      -- for _, server in ipairs(servers) do
      --   lspconfig[server].setup({
      --     on_attach = on_attach,
      --   })
      -- end
    end,
  },
}
