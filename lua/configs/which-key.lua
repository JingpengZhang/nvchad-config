local wk = require "which-key"

wk.register({
  n = {
    name = "NvimTree",
    t = {
      "<cmd>NvimTreeToggle<CR>",
      "Open or close the tree.",
    },
  },
  s = {
    name = "Search",
    a = {
      "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
      "Search File In All Files (Include Hidden File)",
    },
    b = { "<cmd>Telescope buffers<CR>", "Search Buffer In Opening Buffers" },
    f = { "<cmd>Telescope find_files<cr>", "Search File In Files" },
    g = { "<cmd>Telescope live_grep<CR>", "Search String In Live Grep" },
    o = { "<cmd>Telescope oldfiles<CR>", "Search File In Old Files" },
    s = { "<cmd>Telescope current_buffer_fuzzy_find<CR>", "Search String In Current Buffer" },
  },
  g = {
    name = "Git",
    h = {
      function()
        vim.lsp.buf.hover()
      end,
      "View Type Difinition",
    },
    d = {
      "<cmd>DiffviewOpen<CR>",
      "Open Diffview",
    },
  },
  c = {
    name = "Code",
    u = {
      function()
        vim.lsp.buf.execute_command {
          command = "typescript.removeUnusedImports",
          arguments = { vim.api.nvim_buf_get_name(0) },
        }
        vim.lsp.buf.execute_command {
          command = "javascript.removeUnusedImports",
          arguments = { vim.api.nvim_buf_get_name(0) },
        }
      end,
      "Remove Unused Imports",
    },
    o = {
      function()
        vim.lsp.buf.execute_command {
          command = "typescript.organizeImports",
          arguments = { vim.api.nvim_buf_get_name(0) },
        }
      end,
      "Organize Imports",
    },

    s = {
      function()
        vim.lsp.buf.execute_command {
          command = "typescript.sortImports",
          arguments = { vim.api.nvim_buf_get_name(0) },
        }
        vim.lsp.buf.execute_command {
          command = "javascript.sortImports",
          arguments = { vim.api.nvim_buf_get_name(0) },
        }
      end,
      "Sort Imports",
    },
  },
  z = {
    name = "vvv",
  },
}, { prefix = "<leader>" })
