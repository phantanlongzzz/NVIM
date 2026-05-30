return {
  -- Giao diện Tender
  {
    "jacoborus/tender.vim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme tender")
    end,
  },

  -- Icons
  { "nvim-tree/nvim-web-devicons", lazy = true },

  -- Lualine (Đã đồng bộ sang màu Tender cứng)
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "tender",
          section_separators   = { left = "", right = "" },
          component_separators = { left = "│", right = "│" },
          globalstatus = true,
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = {
            { "branch", icon = "" },
            { 
              "diff", 
              symbols = { added = " ", modified = " ", removed = " " }, 
              -- Đổi sang mã màu HEX chuẩn của Tender
              diff_color = { 
                added    = { fg = "#b8bb26" }, -- Xanh lá 
                modified = { fg = "#ffc24b" }, -- Vàng chanh
                removed  = { fg = "#f43753" }  -- Đỏ
              } 
            },
          },
          lualine_c = { { "filename", path = 1, symbols = { modified = " ●", readonly = " " } } },
          lualine_x = {
            { 
              "diagnostics", 
              sources = { "nvim_lsp" }, 
              symbols = { error = " ", warn = " ", info = " ", hint = " " }, 
              -- Đổi sang mã màu HEX chuẩn của Tender cho đồng bộ
              diagnostics_color = { 
                error = { fg = "#f43753" }, 
                warn  = { fg = "#ffc24b" }, 
                info  = { fg = "#b3deef" }, 
                hint  = { fg = "#73cef4" } 
              } 
            },
            "encoding", "fileformat", "filetype",
          },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
        -- PHẦN CẤU HÌNH WINBAR PHẲNG MÀU ĐEN
        winbar = {
          lualine_a = {
            {
              function()
                local filename = vim.fn.expand("%:t")
                local dir = vim.fn.expand("%:p:h")
                local home = vim.fn.expand("$HOME")
                dir = dir:gsub(home, "~")
                if filename == "" then filename = "[No Name]" end
                return string.format(" %s (%s) - Nvim", filename, dir)
              end,
              color = { fg = "#E6EAED", bg = "#010101", gui = "none" }, 
              separator = { left = "", right = "" },
              padding = 0,
            },
          },
        },
        inactive_winbar = {
          lualine_a = {
            {
              function()
                local filename = vim.fn.expand("%:t")
                local dir = vim.fn.expand("%:p:h")
                local home = vim.fn.expand("$HOME")
                dir = dir:gsub(home, "~")
                if filename == "" then filename = "[No Name]" end
                return string.format(" %s (%s) - Nvim", filename, dir)
              end,
              color = { fg = "#8A9191", bg = "#393836", gui = "none" }, 
              separator = { left = "", right = "" },
              padding = 0,
            },
          },
        },
      })
    end,
  },

  -- Cây thư mục (Nvim-Tree)
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        view = { width = 30 }
      })
    end,
  },

  -- Bộ tô màu code xịn (Treesitter)
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local configs = require("nvim-treesitter")
      configs.setup({
        ensure_installed = { "lua", "python", "cpp", "vim", "vimdoc", "markdown" },
        highlight = { 
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
      })
    end,
  },
}