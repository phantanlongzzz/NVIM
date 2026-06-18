return {
  -- Anysphere Theme
  {
    "dapovich/anysphere.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("anysphere").setup({
        transparent = false,
        italics = true,

        -- Tuỳ chỉnh màu nếu muốn
        colors = {},

        themes = function(colors)
          return {
            -- CursorLine nổi bật hơn
            CursorLine = { bg = "#1e1f22" },

            -- NvimTree đồng bộ background
            NvimTreeNormal = { bg = colors.bg },
            NvimTreeNormalNC = { bg = colors.bg },

            -- Terminal
            NormalFloat = { bg = colors.bg },

            -- Diagnostics
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

  -- Lualine
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "auto", -- để tự lấy màu từ Anysphere
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          globalstatus = true,
        },

        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff" },
          lualine_c = {
            {
              "filename",
              path = 1,
              symbols = {
                modified = " ●",
                readonly = " ",
              },
            },
          },
          lualine_x = {
            {
              "diagnostics",
              sources = { "nvim_lsp" },
              symbols = {
                error = " ",
                warn = " ",
                info = " ",
                hint = "󰌵 ",
              },
            },
            "encoding",
            "fileformat",
            "filetype",
          },
          lualine_y = { "progress" },
          lualine_z = { "location" },
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