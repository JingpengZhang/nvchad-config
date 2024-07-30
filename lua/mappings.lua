require "nvchad.mappings"
require "configs.which-key"

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

map("n", "gh", function()
  vim.lsp.buf.hover()
end, { desc = "View Type Difinition" })

-- go to next error
map("n", "[e", function()
  vim.diagnostic.goto_next {
    float = true,
    severity = vim.diagnostic.severity.ERROR,
  }
end)

--go to prev error
map("n", "]e", function()
  vim.diagnostic.goto_prev {
    float = true,
    severity = vim.diagnostic.severity.ERROR,
  }
end)

-- terminal
map({ "n", "t" }, "<C-/>", function()
  require("nvchad.term").toggle {
    pos = "float",
    id = "floatTerm",
    float_opts = {
      width = 0.7,
      height = 0.7,
      row = 0.15,
      col = 0.15,
    },
  }
end)

map({ "n", "t" }, "<C-g>", function()
  require("nvchad.term").toggle {
    pos = "float",
    id = "floatTermForLazygit",
    cmd = "lazygit",
    float_opts = {
      width = 1,
      height = 1,
    },
  }
end)

-- hop
map({ "n" }, "<leader>j", function()
  require("hop").hint_words()
end, { desc = "Jump" })
