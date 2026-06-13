local keymap = vim.keymap

-- ============================================================================
-- 1. QUẢN LÝ FILE & TÌM KIẾM (NvimTree & Telescope)
-- ============================================================================
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })

local builtin = require("telescope.builtin")
keymap.set("n", "<leader>ff", builtin.find_files, {})
keymap.set("n", "<leader>fg", builtin.live_grep, {})
keymap.set("n", "<leader>fb", builtin.buffers, {})

-- ============================================================================
-- 2. TERMINAL CHIA DỌC SANG PHẢI & CHẠY CODE
-- ============================================================================
keymap.set("n", "<F4>", ":vsplit | terminal<CR>i", { silent = true })

-- F5: Python
keymap.set("n", "<F5>", ":w | vsplit | terminal python %<CR>", { silent = true })

-- F6: C++ - Windows
keymap.set("n", "<F6>", function()
  local file = vim.fn.expand("%")
  local name = vim.fn.expand("%:r")

  vim.cmd("w")
  vim.cmd("vsplit")
  vim.cmd(
    "terminal g++ -std=c++23 -O2 -Wall -Wextra "
      .. file
      .. " -o "
      .. name
      .. " && .\\"
      .. name
      .. ".exe"
  )
end)

-- ============================================================================
-- 3. ĐIỀU HƯỚNG NHANH GIỮA CÁC CỬA SỔ
-- ============================================================================
keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], { silent = true })
keymap.set("n", "<C-l>", "<C-w>l", { silent = true })

-- ============================================================================
-- 4. THEME
-- ============================================================================
keymap.set("n", "<leader>th", ":Huez<CR>", { silent = true })
keymap.set("n", "<leader>tf", ":HuezFavorites<CR>", { silent = true })