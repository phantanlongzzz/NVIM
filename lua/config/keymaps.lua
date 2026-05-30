local keymap = vim.keymap

-- ============================================================================
-- 1. QUẢN LÝ FILE & TÌM KIẾM (NvimTree & Telescope)
-- ============================================================================
-- Space + e: Bật / Tắt cây thư mục
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })

-- Bộ ba phím tắt Telescope
local builtin = require("telescope.builtin")
keymap.set("n", "<leader>ff", builtin.find_files, {})  -- Space + f + f: Tìm file nhanh
keymap.set("n", "<leader>fg", builtin.live_grep, {})   -- Space + f + g: Tìm chữ xuyên suốt các file
keymap.set("n", "<leader>fb", builtin.buffers, {})     -- Space + f + b: Xem các file đang mở gần đây

-- ============================================================================
-- 2. TERMINAL CHIA DỌC SANG PHẢI & CHẠY CODE
-- ============================================================================
-- F4: Mở một Terminal rỗng bên phải
keymap.set("n", "<F4>", ":vsplit | terminal<CR>i", { silent = true })

-- F5: Tự động lưu và chạy Python (Thêm chữ i ở cuối để vào thẳng chế độ nhập liệu)
keymap.set("n", "<F5>", ":w | vsplit | terminal python %<CR>i", { silent = true })

-- F6: Tự động lưu, biên dịch và chạy C++ (Cũng thêm chữ i ở cuối)
keymap.set("n", "<F6>", ":w | vsplit | terminal g++ -O2 -std=c++17 % -o %< && ./%<<CR>i", { silent = true })


-- ============================================================================
-- 3. ĐIỀU HƯỚNG NHANH GIỮA CÁC CỬA SỔ (Splits)
-- ============================================================================
-- Nhấn Ctrl + h để nhảy từ Terminal (bên phải) về lại file code (bên trái)
keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], { silent = true })

-- Nhấn Ctrl + l để nhảy từ file code (bên trái) sang Terminal (bên phải)
keymap.set("n", "<C-l>", "<C-w>l", { silent = true })