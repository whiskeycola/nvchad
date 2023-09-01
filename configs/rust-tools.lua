local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local options = {
  server = {
    on_attach = on_attach,
    capabilities = capabilities,
  },
  hover_actions = {
    auto_focus = true,
  },
  -- dap = {
  --   adapter = {
  --     type = "executable",
  --     command = "rust-lldb",
  --     name = "rt_lldb",
  --   },
  -- },
}
require("rust-tools").setup(options)
