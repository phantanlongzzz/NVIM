return {
  -- Điền hẳn link GitHub chuẩn vào đây để lazy.nvim không tự chế thêm đuôi .nvim nữa
  "https://github.com/duarteocarmo/cursor-themes",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("cursor-dark")
  end,
}