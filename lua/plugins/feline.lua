return {
  "feline-nvim/feline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  priority = 999,
  config = function()
    local feline = require("feline")
    local vi_mode = require("feline.providers.vi_mode")

    -- 1. Định nghĩa các hằng số màu sắc & chế độ
    local LEFT = 1
    local RIGHT = 2

    local MODE_COLORS = {
      ["NORMAL"] = "green",
      ["COMMAND"] = "skyblue",
      ["INSERT"] = "orange",
      ["REPLACE"] = "red",
      ["LINES"] = "violet",
      ["VISUAL"] = "violet",
      ["OP"] = "yellow",
      ["BLOCK"] = "yellow",
      ["V-REPLACE"] = "yellow",
      ["ENTER"] = "yellow",
      ["MORE"] = "yellow",
      ["SELECT"] = "yellow",
      ["SHELL"] = "yellow",
      ["TERM"] = "yellow",
      ["NONE"] = "yellow",
    }

    local GRUVBOX = {
      fg = "#ebdbb2",
      bg = "#3c3836",
      black = "#3c3836",
      skyblue = "#83a598",
      cyan = "#8ec07c",
      green = "#b8bb26",
      oceanblue = "#076678",
      blue = "#458588",
      magenta = "#d3869b",
      orange = "#d65d0e",
      red = "#fb4934",
      violet = "#b16286",
      white = "#ebdbb2",
      yellow = "#fabd2f",
    }

    -- 2. Bộ hàm Helper bổ trợ cấu trúc dải vát chéo
    local function get_filename()
      local filename = vim.api.nvim_buf_get_name(0)
      if filename == "" then
        return "[no name]"
      end
      return vim.fn.fnamemodify(filename, ":~:.")
    end

    local function get_filetype()
      local filetype = vim.bo.filetype
      if filetype == "" then
        return "[no type]"
      end
      return filetype:lower()
    end

    local function wrap(string) return " " .. string .. " " end
    local function wrap_left(string) return " " .. string .. " " end
    local function wrap_right(string) return " " .. string .. " " end

    local function wrapped_provider(provider, wrapper)
      return function(component, opts)
        return wrapper(provider(component, opts))
      end
    end

    local function provide_mode() return vi_mode.get_vim_mode() end
    local function provide_filename() return get_filename() end
    local function provide_filetype() return get_filetype() end
    local function provide_linenumber()
      local cursor_line, _ = unpack(vim.api.nvim_win_get_cursor(0))
      return cursor_line .. "/" .. vim.api.nvim_buf_line_count(0)
    end

    -- 3. Khởi tạo cấu trúc bảng Components
    local components = {
      active = { {}, {} },
      inactive = { {}, {} },
    }

    -- 4. Chèn các thành phần vào phân vùng TRÁI (LEFT)
    -- Khối 1: Chế độ Gõ (NORMAL/INSERT)
    table.insert(components.active[LEFT], {
      name = "mode",
      provider = wrapped_provider(provide_mode, wrap),
      right_sep = "slant_right",
      hl = function()
        return {
          fg = "black",
          bg = vi_mode.get_mode_color(),
          style = "bold",
        }
      end,
    })

    -- Khối 2: Tên Nhánh Git (Có logo  cực đẹp)
    table.insert(components.active[LEFT], {
      name = "git_branch",
      provider = function()
        local git = require("feline.providers.git")
        local branch = git.git_branch()
        if branch and #branch > 0 then
          return wrap_left(" " .. branch)
        else
          return wrap_left("No Git")
        end
      end,
      right_sep = "slant_right",
      hl = {
        bg = "orange",
        fg = "black",
        style = "bold",
      },
    })

    -- Khối 3: Tên File đang mở
    table.insert(components.active[LEFT], {
      name = "filename",
      provider = wrapped_provider(provide_filename, wrap_left),
      right_sep = "slant_right",
      hl = {
        bg = "white",
        fg = "black",
      },
    })

    -- 5. Chèn các thành phần vào phân vùng PHẢI (RIGHT)
    -- Khối 4: Ngôn ngữ lập trình (filetype)
    table.insert(components.active[RIGHT], {
      name = "filetype",
      provider = wrapped_provider(provide_filetype, wrap_right),
      left_sep = "slant_left",
      hl = {
        bg = "white",
        fg = "black",
        style = "bold",
      },
    })

    -- Khối 5: Vị trí con trỏ [Dòng hiện tại / Tổng số dòng]
    table.insert(components.active[RIGHT], {
      name = "linenumber",
      provider = wrapped_provider(provide_linenumber, wrap),
      left_sep = "slant_left",
      hl = {
        bg = "skyblue",
        fg = "black",
        style = "bold",
      },
    })

    -- Khối hiển thị khi cửa sổ không hoạt động (Inactive)
    table.insert(components.inactive[LEFT], {
      name = "filename_inactive",
      provider = wrapped_provider(provide_filename, wrap),
      right_sep = "slant_right",
      hl = {
        fg = "white",
        bg = "black",
      },
    })

    -- 6. Khởi chạy Feline Setup
    feline.setup({
      theme = GRUVBOX,
      components = components,
      vi_mode_colors = MODE_COLORS,
    })
  end,
}