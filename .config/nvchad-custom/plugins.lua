local overrides = require("custom.configs.overrides")

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
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
  
  -- Rust stuff.
  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local crates = require("crates")
      crates.setup({
        popup = {
          autofocus = true,
          show_version_date = true,
        },
        null_ls = {
          enabled = true,
          name = "crates.nvim",
        },
        src = {
          cmp = {
            enabled = true,
          },
        },
      })

      local opts = { silent = true }

      vim.keymap.set('n', '<leader>ct', crates.toggle, opts)
      vim.keymap.set('n', '<leader>cr', crates.reload, opts)

      vim.keymap.set('n', '<leader>cv', crates.show_versions_popup, opts)
      vim.keymap.set('n', '<leader>cf', crates.show_features_popup, opts)
      vim.keymap.set('n', '<leader>cd', crates.show_dependencies_popup, opts)

      vim.keymap.set('n', '<leader>cu', crates.update_crate, opts)
      vim.keymap.set('v', '<leader>cu', crates.update_crates, opts)
      vim.keymap.set('n', '<leader>ca', crates.update_all_crates, opts)
      vim.keymap.set('n', '<leader>cU', crates.upgrade_crate, opts)
      vim.keymap.set('v', '<leader>cU', crates.upgrade_crates, opts)
      vim.keymap.set('n', '<leader>cA', crates.upgrade_all_crates, opts)

      vim.keymap.set('n', '<leader>ce', crates.expand_plain_crate_to_inline_table, opts)
      vim.keymap.set('n', '<leader>cE', crates.extract_crate_into_table, opts)

      vim.keymap.set('n', '<leader>cH', crates.open_homepage, opts)
      vim.keymap.set('n', '<leader>cR', crates.open_repository, opts)
      vim.keymap.set('n', '<leader>cD', crates.open_documentation, opts)
      vim.keymap.set('n', '<leader>cC', crates.open_crates_io, opts)

      require("cmp").setup.buffer({ sources = { { name = "crates" } } })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    override_options = {
      sources = {
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "nvim_lua" },
        { name = "path" },
        { name = "crates" },
      },
    },
  },

  -- Theming.
  { "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup {
        flavour = "latte",
        dim_inactive = {
          enabled = false,
        },
        integrations = {
          cmp = true,
          nvimtree = true,
          treesitter = true,
        },
      }
    end
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    event = "InsertEnter",
    after = "nvim-treesitter",
    requires = "nvim-treesitter/nvim-treesitter",
    config = function()
      require'nvim-treesitter.configs'.setup {
        textobjects = {
          select = {
            enable = true,
            lookahead = true,

            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
            },

            selection_modes = {
              ["@parameter.outer"] = 'v',
              ["@function.outer"] = 'V',
              ["@class.outer"] = '<c-v>',
            },

            include_surrounding_whitespace = true,
          }
        }
      }
    end
  }
}

return plugins
