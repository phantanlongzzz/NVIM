return {
  "romgrk/barbar.nvim",
  dependencies = {
    "lewis6991/gitsigns.nvim",     
    "nvim-tree/nvim-web-devicons", 
  },
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  opts = {
    animation = true,       
    clickable = true,       
    auto_hide = false,     
    icons = {
      buffer_index = false, 
      filetype = { enable = true },
      button = "×", 
      modified = { button = "●" }, 
    },
  },
  config = function(_, opts)
    require("barbar").setup(opts)

  
    local map = vim.keymap.set
    local opts_key = { noremap = true, silent = true }

    map("n", "<Tab>", "<Cmd>BufferNext<CR>", opts_key)
    map("n", "<S-Tab>", "<Cmd>BufferPrevious<CR>", opts_key)

    map("n", "<A-c>", "<Cmd>BufferClose<CR>", opts_key)
  end,
}