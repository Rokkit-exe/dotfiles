-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("v", "<C-S-c>", '"+y', { noremap = true, silent = true, desc = "Copy to system clipboard" })

-- DAP (Debug Adapter Protocol) keymaps
vim.keymap.set("n", "<F5>", function()
  require("dap").continue()
end)
vim.keymap.set("n", "<F10>", function()
  require("dap").step_over()
end)
vim.keymap.set("n", "<F11>", function()
  require("dap").step_into()
end)
vim.keymap.set("n", "<F12>", function()
  require("dap").step_out()
end)
vim.keymap.set("n", "<F2>", function()
  require("dap").toggle_breakpoint()
end)
vim.keymap.set("n", "<F3>", function()
  require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end)
