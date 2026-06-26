local options = {
  number         = true,   
  relativenumber = true,   
  splitright     = true,   -- Mở cửa sổ split mới sang bên phải (rất hợp với competitest)
  splitbelow     = true,   -- Mở cửa sổ split mới xuống bên dưới
  
  expandtab      = true,
  shiftwidth     = 2,      
  tabstop        = 2,     
  softtabstop    = 2,      
  smartindent    = true,   
  cindent        = true,   
  
  termguicolors  = true,   
  cursorline     = false,  
  signcolumn     = "no",
  numberwidth    = 2,      
  
  list           = false,  
  listchars      = { tab = '» ', trail = '·', nbsp = '␣', multispace = '·   ' },

  clipboard      = "unnamedplus", 
  updatetime     = 250,           
  swapfile       = false,        
  
  ignorecase     = true,         
  smartcase      = true,          
}

vim.opt.guicursor = "a:block-blinkon250-blinkoff250"

for key, value in pairs(options) do
  vim.opt[key] = value
end


