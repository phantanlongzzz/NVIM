return {
  {
    "AlexvZyl/nordic.nvim",
    lazy = false,
    priority = 1000, 
    config = function()
      require("nordic").setup({
        bg_darker = true, 
        
        ext_hl = {
          telescope = "flat",
        },
        
        cursorline = {
          bold = false,
          number_bold = true, 
        },
        
      })
    end,
  },
}