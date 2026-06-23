return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",

        separator_style = "thin", 
        
        always_show_bufferline = true,
        show_buffer_close_icons = true,
        show_close_icon = false,
        
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            text_align = "center",
            separator = true,
          }
        },
        
        indicator = {
          style = "icon",
          icon = "▎",
        },
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
      },
    })

    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }

    map("n", "<C-Right>", "<cmd>BufferLineCycleNext<cr>", opts)
    map("n", "<C-Left>", "<cmd>BufferLineCyclePrev<cr>", opts)
    map("n", "<A-c>", "<cmd>bdelete<cr>", opts) 
  end,
}