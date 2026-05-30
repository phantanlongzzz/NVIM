return {
  -- Telescope: Tìm kiếm file
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- Bộ ba LSP (Đã cập nhật theo API vim.lsp mới)
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      -- 1. Khởi chạy Mason
      require("mason").setup()

      local servers = { "pyright" } -- Thêm các ngôn ngữ khác vào đây nếu cần
      
      -- 2. Khởi chạy Mason-LSPConfig để quản lý việc tải các server
      require("mason-lspconfig").setup({
        ensure_installed = servers,
      })

      -- 3. Lấy cấu hình capabilities từ nvim-cmp để hỗ trợ tự động gợi ý chữ
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      
      -- 4. Vòng lặp cấu hình theo chuẩn hiện đại (Sử dụng vim.lsp thay vì lspconfig)
      for _, server in ipairs(servers) do
        -- Thiết lập cấu hình (bao gồm cả capabilities) cho từng server
        vim.lsp.config(server, {
          capabilities = capabilities,
        })
        -- Kích hoạt server hoạt động
        vim.lsp.enable(server)
      end
    end,
  },
}