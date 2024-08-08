return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "smoka7/hop.nvim",
    opts = {
      multi_windows = true,
      keys = "etovxqpdygfblzhckisuran",
      uppercase_labels = true,
    },
    keys = {
      {
        "<leader>fj",
        function()
          require("hop").hint_words()
        end,
        mode = { "n", "x", "o" },
        desc = "hop",
      },
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = function()
      return require "nvchad.configs.nvimtree"
    end,
    config = function(_, opts)
      require("nvim-tree").setup {
        filters = {
          git_ignored = false,
        },
      }
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    config = function()
      require("dressing").setup {
        input = {
          enabled = true,
        },
        select = {
          enabled = true,
        },
      }
    end,
  },

  {

    "nvim-telescope/telescope.nvim",
    config = function()
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
              -- even more opts
            },

            -- pseudo code / specification for writing custom displays, like the one
            -- for "codeactions"
            -- specific_opts = {
            --   [kind] = {
            --     make_indexed = function(items) -> indexed_items, width,
            --     make_displayer = function(widths) -> displayer
            --     make_display = function(displayer) -> function(e)
            --     make_ordinal = function(e) -> string
            --   },
            --   -- for example to disable the custom builtin "codeactions" display
            --      do the following
            --   codeactions = false,
            -- }
          },
        },
      }
      require("telescope").load_extension "ui-select"
    end,
  },

  { "nvim-telescope/telescope-ui-select.nvim", event = "VeryLazy" },

  --
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "html-lsp",
        "css-lsp",
        "prettier",
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "diagnostic-languageserver",
        "dockerfile-language-server",
        "eslint-lsp",
        "goimports",
        "goimports-reviser",
        "gopls",
        "js-debug-adapter",
        "json-lsp",
        "lua-language-server",
        "tailwindcss-language-server",
        "vue-language-server",
        "vtsls",
        "unocss-language-server",
      },
    },
  },
  -- react 注释
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    event = "VeryLazy",
  },
  -- 注释
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = function()
      require("Comment").setup {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
  },
  --
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
      },
    },
  },

  -- 标签自闭合
  {
    "windwp/nvim-ts-autotag",
    lazy = false,
    config = function()
      require("nvim-ts-autotag").setup {
        opts = {
          -- Defaults
          enable_close = true, -- Auto close tags
          enable_rename = true, -- Auto rename pairs of tags
          enable_close_on_slash = false, -- Auto close on trailing </
        },
      }
    end,
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  {
    "f-person/git-blame.nvim",
    lazy = false,
    config = function()
      require("gitblame").setup {
        enable = true,
      }
    end,
  },
  {
    "rareitems/printer.nvim",
    lazy = false,
    config = function()
      require("printer").setup {
        keymap = "gp", -- Plugin doesn't have any keymaps by default
      }
    end,
  },
  {
    "rmagatti/goto-preview",
    lazy = false,
    event = "BufEnter",
    config = function()
      require("goto-preview").setup {
        default_mappings = true,
      }
    end,
  },
  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
    config = function()
      require("diffview").setup {}
    end,
  },
}
