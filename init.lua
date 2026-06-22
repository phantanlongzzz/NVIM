require("config.options")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
})

require("config.keymaps")


vim.opt.signcolumn = "no"        
vim.opt.number = true           
vim.opt.relativenumber = true     

vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPost" }, {
  pattern = "*.cpp",
  callback = function()
    if vim.api.nvim_buf_line_count(0) == 1 and vim.api.nvim_buf_get_lines(0, 0, -1, false)[1] == "" then
      local lines = {
        "#include <bits/stdc++.h>",
        "using namespace std;",
        "",
        "int main() {",
        "    ios::sync_with_stdio(false);",
        "    cin.tie(nullptr);",
        "    ",
        "    return 0;",
        "}",
      }

      vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)

      vim.api.nvim_win_set_cursor(0, { 7, 4 })
    end
  end,
})


vim.o.background = "dark"
vim.cmd.colorscheme("retrobox")