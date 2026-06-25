return {
  -- 1. THEME KODA (Giữ lại từ bước trước)
  {
    "oskarnurm/koda.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("koda").setup({
        transparent = false,
        cache = true,
        styles = {
          functions = { bold = true },
          keywords  = { bold = true },
          comments  = { italic = true },
        },
      })
    end,
  },

  -- 2. THEME ONEDARK MỚI THÊM
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000, -- Ưu tiên load cao để sẵn sàng áp dụng
    config = function()
      require("onedark").setup({
        -- Các style của OneDark: 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'
        style = "darker", -- Bản 'darker' nền rất sâu, cực hợp cho dân cày CP đêm

        transparent = false,     -- Giữ màu nền chuẩn của OneDark
        term_colors = true,      -- Đồng bộ màu với Terminal phía dưới
        ending_tildes = false,   -- Ẩn các dấu ~ thừa thãi ở cuối file cho sạch màn hình

        -- Cấu hình Style chữ cho nét
        code_style = {
          comments = "italic",
          keywords = "bold",
          functions = "bold",
          strings = "none",
          variables = "none",
        },

        plugins = {
          gitsigns = true,
          nvimtree = true,
          telescope = true,
          bufferline = true,
        },
      })

      vim.cmd("colorscheme onedark")
    end,
  },
}