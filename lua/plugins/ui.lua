return {
  -- Anysphere Theme (Vẫn giữ nguyên cho phần code của bác)
  {
    "dapovich/anysphere.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("anysphere").setup({
        transparent = false,
        italics = true,
        colors = {},
        themes = function(colors)
          return {
            CursorLine = { bg = "#1e1f22" },
            NvimTreeNormal = { bg = colors.bg },
            NvimTreeNormalNC = { bg = colors.bg },
            NormalFloat = { bg = colors.bg },
            DiagnosticVirtualTextError = { fg = colors.red },
            DiagnosticVirtualTextWarn = { fg = colors.yellow },
            DiagnosticVirtualTextInfo = { fg = colors.blue },
            DiagnosticVirtualTextHint = { fg = colors.green },
          }
        end,
      })
      vim.o.background = "dark"
      vim.cmd.colorscheme("anysphere")
    end,
  },

  -- Icons
  { "nvim-tree/nvim-web-devicons", lazy = true },

  -- ĐÂY LÀ ĐOẠN LUALINE TẠO RA STATUS LINE Y CHANG ẢNH CỦA BÁC
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          -- 1. Theme "gruvbox" là thứ tạo ra màu cam/đỏ, nâu xám nhạt và xám đậm này
          theme = "gruvbox", 
          
          -- 2. Đặt gạch đứng "|" làm phân cách giữa các thành phần (như utf-8 | unix | lua)
          component_separators = { left = "|", right = "|" },
          
          -- 3. Xoá bỏ dải phân cách mảng để tạo khối vuông cứng cáp
          section_separators = { left = "", right = "" },
          
          globalstatus = true,
        },

        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" }, -- Mặc định lualine đã có icon branch 
          lualine_c = { "filename" },
          
          lualine_x = { 
            "encoding", 
            "fileformat", 
            "filetype" -- Mặc định lualine sẽ chèn icon nvim-web-devicons ( lua)
          },
          lualine_y = { "progress" }, -- Sẽ hiển thị "Top", "Bot", "xx%"
          lualine_z = { "location" }, -- Sẽ hiển thị dòng:cột ("1:1")
        },
      })
    end,
  },

  -- NvimTree
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        view = { width = 30 },
      })
    end,
  },
  
  -- Toggleterm
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        direction = "horizontal",
        size = 12,
        start_in_insert = true,
        persist_size = true,
        close_on_exit = false,
        shade_terminals = false,
      })
    end,
  },
}