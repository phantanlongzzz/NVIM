return {
  -- Icons
  { "nvim-tree/nvim-web-devicons", lazy = true },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "gruvbox", 
          
          component_separators = { left = "|", right = "|" },
          
          section_separators = { left = "", right = "" },
          
          globalstatus = true,
        },

        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" }, 
          lualine_c = { "filename" },
          
          lualine_x = { 
            "encoding", 
            "fileformat", 
            "filetype" 
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