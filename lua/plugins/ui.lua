return {
  -- Giao diện Gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        contrast = "hard",        -- hard cho màu đậm, nổi bật hơn
        transparent_mode = false,
      })
      vim.o.background = "dark"   -- Bắt buộc dark
      vim.cmd("colorscheme gruvbox")
    end,
  },

  -- Icons
  { "nvim-tree/nvim-web-devicons", lazy = true },

  -- Lualine - gruvbox_dark chính thức
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "gruvbox_dark",           -- ← Đây là cái bạn muốn
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          globalstatus = true,
          refresh = { statusline = 100 },
          height = 10,
          padding = 1,
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { 
            "branch", 
            "diff",
          },
          lualine_c = {
            {
              "filename",
              path = 1,
              symbols = { 
                modified = " ●", 
                readonly = " " 
              },
            },
          },
          lualine_x = {
            {
              "diagnostics",
              sources = { "nvim_lsp" },
              symbols = { 
                error = " ", 
                warn  = " ", 
                info  = " ", 
                hint  = "󰌵 " 
              },
            },
            "encoding",
            "fileformat",
            "filetype",
          },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
        inactive_sections = {
          lualine_c = { "filename" },
          lualine_x = { "location" },
        },
      })
    end,
  },

  -- Nvim Tree
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({ view = { width = 30 } })
    end,
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local ok, configs = pcall(require, "nvim-treesitter.configs")
      if ok then
        configs.setup({
          ensure_installed = { "lua", "python", "cpp", "c", "vim", "vimdoc", "markdown" },
          highlight = { enable = true },
          indent = { enable = true },
        })
      end
    end,
  },
}