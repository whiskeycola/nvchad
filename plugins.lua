---@type NvPluginSpec[]
local plugins = {
  -- Override plugin definition options
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  {
    "mhartington/formatter.nvim",
    -- cmd = { "Format", "FormatWrite" },
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.formatter"
    end,
  },
  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = require "custom.configs.mason",
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = require "custom.configs.treesitter",
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = require "custom.configs.nvim-tree",
  },
  -- {
  --   "laytan/tailwind-sorter.nvim",
  --   dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-lua/plenary.nvim" },
  --   build = "cd formatter && npm i && npm run build",
  --   ft = { "handlebars" },
  --
  --   cmd = { "TailwindSort" },
  --   config = function()
  --     require("tailwind-sorter").setup {
  --       on_save_enabled = true,
  --       on_save_pattern = { "*.hbs" },
  --     }
  --   end,
  -- },
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
    opts = { terminals = {
      shell = "/usr/bin/zsh",
    } },
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
  -- {
  --   "simrat39/rust-tools.nvim",
  --   enable = true,
  --   dependencies = "neovim/nvim-lspconfig",
  --   ft = "rust",
  --   init = function()
  --     require("core.utils").load_mappings "rust_tools"
  --   end,
  --   opts = function()
  --     return require "custom.configs.rust-tools"
  --   end,
  --   config = function(_, opts)
  --     require("rust-tools").setup(opts)
  --   end,
  -- },
  {
    "mrcjkb/rustaceanvim",
    version = "^4", -- Recommended
    lazy = false,
    ft = { "rust" },

    config = function()
      vim.g.rustaceanvim = {
        server = {
          on_attach = function(client, bufnr)
            if vim.lsp.inlay_hint then
              -- vim.lsp.inlay_hint.enable(bufnr, true)
              vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
            end

            local on_attach = require("plugins.configs.lspconfig").on_attach
            on_attach(client, bufnr)
          end,
        },
      }

      require("core.utils").load_mappings "rustaceanvim"
    end,
  },
  -- {
  --   "mrcjkb/rustaceanvim",
  --   version = "^4", -- Recommended
  --   lazy = false, -- This plugin is already lazy
  --   ft = { "rust" },
  -- },
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
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },

  -- typescript
  {
    "pmizio/typescript-tools.nvim",
    ft = {
      "typsescript",
      "typescriptreact",
      "typescript.tsx",
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "html",
    },
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = function()
      return require "custom.configs.typescript-tools"
    end,
    config = function(_, opts)
      require("typescript-tools").setup(opts)
    end,
  },
  {
    "whiskeycola/vim-mustache-handlebars",
    ft = { "handlebars" },
    -- config = function()
    --   require("vim-mustache-handlebars").setup()
    -- end,
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
      require("core.utils").load_mappings "gopher"
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },
  --
  -- {
  --   "pmizio/typescript-tools.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "neovim/nvim-lspconfig",
  --   },
  --   opts = function()
  --     return require "custom.configs.typescript-tools"
  --   end,
  --   config = function(_, opts)
  --     require("typescript-tools").setup(opts)
  --   end,
  -- },
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
