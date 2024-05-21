local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local options = {
  -- tools = {
  --   inlay_hints = { auto = false },
  -- },
  server = {
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
      --
      -- if vim.lsp.inlay_hint then
      --   vim.lsp.inlay_hint.enable(bufnr, true)
      -- end
    end,
    capabilities = capabilities,
    -- settings = {
    --   ['rust-analyzer'] = {
    --     rustfmt
    --   }
    -- }
  },
}
return options
