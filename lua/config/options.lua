local options = {
  number         = true,   
  relativenumber = true,   
  splitright     = true,   
  splitbelow     = true,   
  expandtab      = true,
  shiftwidth     = 2,      
  tabstop        = 2,     
  softtabstop    = 2,      
  smartindent    = true,   
  termguicolors  = true,   
  cursorline     = false,   
  signcolumn     = "yes:1", 
  numberwidth    = 2,       
  list           = true,  
  listchars      = { tab = '» ', trail = '·', nbsp = '␣' },

  clipboard = "unnamedplus",
  updatetime = 250,
  swapfile = false,
}
vim.opt.guicursor = "a:block"


for key, value in pairs(options) do
  vim.opt[key] = value
end