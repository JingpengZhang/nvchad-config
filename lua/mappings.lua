require "nvchad.mappings"

local wk = require "which-key"

wk.register({
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
    d = {
      "<cmd>DiffviewOpen<CR>",
      "Open Diffview",
    },
  },
  c = {
    name = "Code",
  },
  z = {
    name = "vvv",
  },
}, { prefix = "<leader>" })

-- add yours here
local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- buffers
map("n", "<S-l>", function()
  require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })

map("n", "<S-h>", function()
  require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })

map("n", "<leader>bo", function()
  local bufs = vim.api.nvim_list_bufs()
  local current_buf = vim.api.nvim_get_current_buf()
  for _, i in ipairs(bufs) do
    if i ~= current_buf then
      vim.api.nvim_buf_delete(i, {})
    end
  end
end, { desc = "Close other Buffer" })

-- window
map("n", "<leader>wv", "<C-w>v", {
  desc = "Split window to Vertically",
})

map("n", "<leader>wq", "<C-w>q", {
  desc = "Close Window",
})

map("n", "<leader>ws", "<C-w>v", {
  desc = "Split window to Horizontal",
})
