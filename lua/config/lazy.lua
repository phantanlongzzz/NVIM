-- 1. Đoạn code tự động tải Lazy.nvim từ GitHub nếu máy chưa có
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 2. Chỉ định cấu hình: Ép Lazy.nvim quét toàn bộ các file trong thư mục "plugins"
require("lazy").setup({
  spec = {
    -- tự động nạp ui.lua, lsp.lua
    { import = "plugins" }, 
  },
  -- Tự động kiểm tra bản cập nhật của các plugin
  checker = { enabled = true }, 
})