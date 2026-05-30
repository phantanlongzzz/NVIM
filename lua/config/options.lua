vim.g.mapleader = " " -- Đặt nút Space (Dấu cách) làm nút kích hoạt phím tắt (Leader key)

local opt = vim.opt

opt.number = true          -- Hiển thị số dòng
opt.relativenumber = true  -- Hiển thị số dòng tương đối (rất tiện để nhảy dòng)
opt.splitright = true      -- Mở cửa sổ dọc về bên phải
opt.splitbelow = true      -- Mở cửa sổ ngang về bên dưới
opt.expandtab = true       -- Chuyển Tab thành Space
opt.shiftwidth = 4         -- Thụt lề 4 space (chuẩn Python)
opt.tabstop = 4            -- 1 tab = 4 space
opt.smartindent = true     -- Tự động thụt lề thông minh
opt.termguicolors = true   -- Bật màu sắc 24-bit (bắt buộc cho Kanagawa)
opt.cursorline = true      -- Highlight dòng đang đứng