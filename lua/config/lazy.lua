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
    -- Theme
    {
      "rebelot/kanagawa.nvim",
      lazy = false,
      priority = 1000,
      config = function()
        require("kanagawa").setup({ theme = "dragon" })
        vim.cmd("colorscheme kanagawa-dragon")
      end,
    },

    -- Icons
    { "nvim-tree/nvim-web-devicons", lazy = true },

    -- Lualine
    {
      "nvim-lualine/lualine.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      config = function()
        local colors = {
          bg     = "#181616", bg3    = "#393836",
          fg     = "#C5C9C5", fg_dim = "#8A9191",
          red    = "#C4746E", green  = "#87A987",
          teal   = "#6A9589", blue   = "#8BA4B0",
          purple = "#A292A3", yellow = "#C4B28A",
        }
        local dragon = {
          normal   = { a = { fg = colors.bg, bg = colors.teal,   gui = "bold" }, b = { fg = colors.fg,     bg = colors.bg3 }, c = { fg = colors.fg_dim, bg = colors.bg3 } },
          insert   = { a = { fg = colors.bg, bg = colors.green,  gui = "bold" }, b = { fg = colors.fg,     bg = colors.bg3 }, c = { fg = colors.fg_dim, bg = colors.bg3 } },
          visual   = { a = { fg = colors.bg, bg = colors.purple, gui = "bold" }, b = { fg = colors.fg,     bg = colors.bg3 }, c = { fg = colors.fg_dim, bg = colors.bg3 } },
          replace  = { a = { fg = colors.bg, bg = colors.red,    gui = "bold" }, b = { fg = colors.fg,     bg = colors.bg3 }, c = { fg = colors.fg_dim, bg = colors.bg3 } },
          command  = { a = { fg = colors.bg, bg = colors.yellow, gui = "bold" }, b = { fg = colors.fg,     bg = colors.bg3 }, c = { fg = colors.fg_dim, bg = colors.bg3 } },
          inactive = { a = { fg = colors.fg_dim, bg = colors.bg3 },              b = { fg = colors.fg_dim, bg = colors.bg3 }, c = { fg = colors.fg_dim, bg = colors.bg3 } },
        }
        require("lualine").setup({
          options = {
            theme = dragon,
            section_separators   = { left = "", right = "" },
            component_separators = { left = "│", right = "│" },
            globalstatus = true,
          },
          sections = {
            lualine_a = { "mode" },
            lualine_b = {
              { "branch", icon = "" },
              {
                "diff",
                symbols = { added = " ", modified = " ", removed = " " },
                diff_color = {
                  added    = { fg = colors.green },
                  modified = { fg = colors.yellow },
                  removed  = { fg = colors.red },
                },
              },
            },
            lualine_c = {
              { "filename", path = 1, symbols = { modified = " ●", readonly = " " } },
            },
            lualine_x = {
              {
                "diagnostics",
                sources = { "nvim_lsp" },
                symbols = { error = " ", warn = " ", info = " ", hint = " " },
                diagnostics_color = {
                  error = { fg = colors.red },
                  warn  = { fg = colors.yellow },
                  info  = { fg = colors.blue },
                  hint  = { fg = colors.teal },
                },
              },
              "encoding", "fileformat", "filetype",
            },
            lualine_y = { "progress" },
            lualine_z = { "location" },
          },
          winbar = {
            lualine_c = {
              { "filename", path = 1, symbols = { modified = " ●", readonly = " ", unnamed = "[No Name]" } },
            },
            lualine_z = {
              { function() return "NVIM" end, icon = "" },
            },
          },
          inactive_winbar = {
            lualine_c = {
              { "filename", path = 1, symbols = { modified = " ●", readonly = " ", unnamed = "[No Name]" } },
            },
          },
        })
      end,
    },

    -- Completion
    {
      "hrsh7th/nvim-cmp",
      dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
      },
      config = function()
        local cmp = require("cmp")
        cmp.setup({
          snippet = {
            expand = function(args)
              require("luasnip").lsp_expand(args.body)
            end,
          },
          mapping = cmp.mapping.preset.insert({
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<CR>"]      = cmp.mapping.confirm({ select = true }),
            ["<Tab>"]     = cmp.mapping.select_next_item(),
            ["<S-Tab>"]   = cmp.mapping.select_prev_item(),
          }),
          sources = {
            { name = "nvim_lsp" },
            { name = "luasnip" },
            { name = "buffer" },
            { name = "path" },
          },
        })
      end,
    },

    -- LSP
    {
      "neovim/nvim-lspconfig",
      dependencies = { "hrsh7th/cmp-nvim-lsp" },
      config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        vim.lsp.config("pyright", { capabilities = capabilities })
        vim.lsp.enable("pyright")
      end,
    },
  },
})
