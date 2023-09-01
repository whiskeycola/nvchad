---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- lua stuff
        "lua-language-server",
        "stylua",

        -- web dev stuff
        "css-lsp",
        "html-lsp",
        "typescript-language-server",
        "prettierd",
        "tailwindcss-language-server",

        -- c/cpp stuff
        "clangd",
        "clang-format",

        -- rust
        "rust-analyzer",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "c",
        "markdown",
        "markdown_inline",
        "rust",
      },
      indent = {
        enable = true,
        -- disable = {
        --   "python"
        -- },
      },
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = {
        enable = true,
      },

      renderer = {
        highlight_git = true,
        icons = {
          show = {
            git = true,
          },
        },
      },
    },
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "roobert/tailwindcss-colorizer-cmp.nvim",
        config = function(_, opts)
          require("tailwindcss-colorizer-cmp").setup(opts)
        end,
      },
    },
    opts = function()
      local M = require "plugins.configs.cmp"
      local format_kind = M.formatting.format
      table.insert(M.sources, { name = "crates" })
      M.formatting.format = function(entry, item)
        format_kind(entry, item)
        return require("tailwindcss-colorizer-cmp").formatter(entry, item)
      end
      return M
    end,
  },

  {
    "VonHeikemen/fine-cmdline.nvim",
    dependencies = {
      {
        "MunifTanjim/nui.nvim",
      },
    },
    lazy = false,
  },

  {
    "NvChad/nvterm",
    opts = {
      terminals = {
        shell = "/home/dima/.cargo/bin/nu",
      },
    },
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        tailwind = true,
      },
    },
    config = function(_, opts)
      require("colorizer").setup(opts)
    end,
  },

  -- rust
  {
    "simrat39/rust-tools.nvim",

    dependencies = "neovim/nvim-lspconfig",
    ft = "rust",
    init = function()
      require("core.utils").load_mappings "rust_tools"
    end,
    config = function()
      require "custom.configs.rust-tools"
    end,
  },

  {
    "saecki/crates.nvim",
    ft = { "rust", "toml" },
    config = function(_, opts)
      local crates = require "crates"
      crates.setup(opts)
      crates.show()
    end,
  },

  {
    "mfussenegger/nvim-dap",
    init = function()
      require("core.utils").load_mappings "dap"
    end,
  },

  -- To make a plugin not be loaded
  -- {

  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example

  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
