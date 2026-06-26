return {
  -- Icons
  { "nvim-tree/nvim-web-devicons", lazy = true },

  {
    "nvim-lualine/lualine.nvim",
    enabled = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "auto", 
          section_separators = { left = "", right = "" },
          component_separators = { left = "", right = "" },
          globalstatus = true,
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" }, 
          lualine_c = { { "filename", path = 1 } }, 
          lualine_x = { "filetype" },
          lualine_y = { "progress" }, 
          lualine_z = { "location" }, 
        },
      })
    end,
  },

  -- NvimTree (Trình quản lý file)
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        view = { width = 30 },
      })
    end,
  },
  
  -- Toggleterm (Cửa sổ terminal nhanh)
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

  -- Bufferline (Thanh quản lý file trên đỉnh - ĐÃ ĐỔI SANG BẢN XỊN HƠN) 🚀
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bufferline").setup({
        options = {
          mode = "buffers",
          -- CHÍNH LÀ DÒNG NÀY: Biến các tab file thành hình mũi tên nhọn hoắt xếp lớp lên nhau
          separator_style = "slant", 
          
          always_show_bufferline = true, -- Luôn hiện để ngắm
          show_buffer_close_icons = false, -- Ẩn nút X tắt file cho tối giản
          show_close_icon = false,
          color_icons = true, -- Hiện icon màu của ngôn ngữ
          
          -- Giúp NeoTree/NvimTree không bị thanh này đè lên đầu
          offsets = {
            {
              filetype = "NvimTree",
              text = "🗂️ File Explorer",
              text_align = "center",
              separator = true,
            },
          },
        },
      })
    end,
  },
}