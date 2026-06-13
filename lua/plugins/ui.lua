return {
  -- Giao diện Gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        contrast = "hard",        -- "soft" hoặc "hard"
        transparent_mode = false,
      })
      vim.cmd("colorscheme gruvbox")
    end,
  },

  -- Icons
  { "nvim-tree/nvim-web-devicons", lazy = true },

  -- Lualine
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "gruvbox",
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
              diff_color = { 
                added    = { fg = "#b8bb26" },
                modified = { fg = "#fabd2f" },
                removed  = { fg = "#fb4934" }  
              } 
            },
          },
          lualine_c = { { "filename", path = 1, symbols = { modified = " ●", readonly = " " } } },
          lualine_x = {
            { 
              "diagnostics", 
              sources = { "nvim_lsp" }, 
              symbols = { error = " ", warn = " ", info = " ", hint = " " }, 
              diagnostics_color = { 
                error = { fg = "#fb4934" }, 
                warn  = { fg = "#fabd2f" }, 
                info  = { fg = "#83a598" }, 
                hint  = { fg = "#8ec07c" } 
              } 
            },
            "encoding", "fileformat", "filetype",
          },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      })
    end,
  },

  -- Cây thư mục
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        view = { width = 30 }
      })
    end,
  },

  -- Treesitter (ĐÃ SỬA)
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      -- Cách fix an toàn nhất hiện nay
      local ok, configs = pcall(require, "nvim-treesitter.configs")
      if ok then
        configs.setup({
          ensure_installed = { "lua", "python", "cpp", "vim", "vimdoc", "markdown", "c" },
          highlight = { 
            enable = true,
            additional_vim_regex_highlighting = false,
          },
          indent = { enable = true },
        })
      end
    end,
  },
}