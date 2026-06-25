return {
  {
    "oskarnurm/koda.nvim",
    lazy = false,
    priority = 1000, 
    config = function()
      require("koda").setup({
        transparent = false, 
        cache = true,        
        
        styles = {
          functions = { bold = true }, 
          keywords  = { bold = true }, 
          comments  = { italic = true }, 
        },
      })
      
      --vim.cmd("colorscheme koda") 
    end,
  },
}