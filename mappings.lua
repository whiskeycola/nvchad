---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    ["<leader>t"] = {
      "<cmd> exe 'silent !kitty --detach --directory ' . getcwd() <CR>",
      "open terminal new window",
    },
  },
}

M.rust_tools = {
  plugin = true,
  n = {
    ["<leader>k"] = {
      function()
        require("rust-tools.hover_actions").hover_actions()
      end,
      "Hover actions",
    },
    ["<leader>a"] = {
      function()
        require("rust-tools.code_action_group").code_action_group()
      end,
      "Code action group",
    },
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>" },
    ["<leader>dus"] = {
      function()
        local widgets = require "dap.ui.widgets"
        local sidebar = widgets.sidebar(widgets.scopes)
        sidebar.open()
      end,
      "Open debugging sidebar",
    },
  },
}

M.crates = {
  n = {
    ["<leader>rcu"] = {
      function()
        require("crates").update_all_crates()
      end,
      "Update crates",
    },
  },
}
return M
