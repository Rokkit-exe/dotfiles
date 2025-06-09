return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "leoluz/nvim-dap-go",
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup()
      require("dap-go").setup()

      -- Open and close dapui automatically
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      -- Debug adapter for Go

      local dap = require("dap")

      dap.adapters.go = function(callback, _)
        local handle
        local pid_or_err
        local port = 38697
        handle, pid_or_err = vim.loop.spawn("dlv", {
          args = { "dap", "-l", "127.0.0.1:" .. port },
          detached = true,
        }, function(code)
          handle:close()
          print("Delve exited with code: " .. code)
        end)
        -- Wait for the delve server to start
        vim.defer_fn(function()
          callback({ type = "server", host = "127.0.0.1", port = port })
        end, 100)
      end

      dap.configurations.go = {
        {
          type = "go",
          name = "Debug",
          request = "launch",
          program = "${file}",
        },
      }
      -- 👇 Wrap your config in a list/table!
      dap.configurations.go = {
        {
          type = "go",
          name = "Attach to Process (PID)",
          mode = "local",
          request = "attach",
          processId = require("dap.utils").pick_process,
          stopOnEntry = true,
        },
      }
    end,
  },
}
