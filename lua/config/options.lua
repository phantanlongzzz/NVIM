local options = {
  number         = true,   
  relativenumber = true,   
  splitright     = true,   -- Mở cửa sổ split mới sang bên phải (rất hợp với competitest)
  splitbelow     = true,   -- Mở cửa sổ split mới xuống bên dưới
  
  -- Thiết lập khoảng cách thụt lề chuẩn cho C++ CP (4 spaces)
  expandtab      = true,
  shiftwidth     = 8,      
  tabstop        = 8,     
  softtabstop    = 8,      
  smartindent    = true,   
  cindent        = true,   -- Bật thuật toán căn lề chuyên dụng riêng cho ngôn ngữ họ C/C++
  
  termguicolors  = true,   -- Bật hệ màu 24-bit chuẩn cho theme Cursor/GitHub
  cursorline     = false,  
  signcolumn     = "no",   -- Thống nhất tắt signcolumn ở đây để màn hình code CP rộng rãi nhất
  numberwidth    = 2,      
  
  -- Hiển thị ký tự ẩn (Giúp kiểm tra xem có bị thừa khoảng trắng cuối dòng không)
  list           = true,  
  listchars      = { tab = '» ', trail = '·', nbsp = '␣', multispace = '·   ' },

  -- Các tính năng bổ trợ CP cực mạnh
  clipboard      = "unnamedplus", -- Copy/Paste thẳng ra trình duyệt hoặc Discord không cần chuột
  updatetime     = 250,           -- Giảm thời gian phản hồi hệ thống (mặc định là 4000ms quá chậm)
  swapfile       = false,         -- Tắt swapfile vì làm CP không cần khôi phục file tạm, tránh rác ổ cứng
  
  -- Tối ưu hóa tìm kiếm biến/hàm khi đang đọc đề và debug
  ignorecase     = true,          -- Tìm kiếm không phân biệt hoa thường
  smartcase      = true,          -- Tự động chuyển sang phân biệt hoa thường nếu bạn gõ chữ IN HOA
}

-- Ép con trỏ chuột luôn ở dạng khối (Block) vững chắc trong mọi chế độ, dễ định vị mắt
vim.opt.guicursor = "a:block"

-- Vòng lặp gán cấu hình tự động
for key, value in pairs(options) do
  vim.opt[key] = value
end