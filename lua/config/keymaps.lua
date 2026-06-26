local keymap = vim.keymap
local opts = { silent = true }

-- File Explorer (NvimTree)
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

keymap.set("n", "<leader>ff", function() require("telescope.builtin").find_files() end, {})
keymap.set("n", "<leader>fg", function() require("telescope.builtin").live_grep() end, {})
keymap.set("n", "<leader>fb", function() require("telescope.builtin").buffers() end, {})

local main_term = nil
local function get_main_term()
    if not main_term then
        local Terminal = require("toggleterm.terminal").Terminal
        main_term = Terminal:new({
            direction = "horizontal",
            hidden = true,
        })
    end
    return main_term
end

-- F4: Bật/Tắt nhanh Terminal
keymap.set("n", "<F4>", function()
    get_main_term():toggle()
end, opts)

-- F5: Lưu và Chạy file Python qua ToggleTerm
keymap.set("n", "<F5>", function()
    vim.cmd("w")
    local file = vim.fn.expand("%:p")
    local term = get_main_term()
    term:open()
    term:send("python \"" .. file .. "\"", true)
end, opts)

-- F6: Lưu, Biên dịch chuẩn CP (-std=c++23) và Chạy file C++ qua ToggleTerm
keymap.set("n", "<F6>", function()
    vim.cmd("w")
    local file = vim.fn.expand("%:p")
    local exe = vim.fn.expand("%:r") .. ".exe"
    local term = get_main_term()
    term:open()
    term:send(
        'g++ -std=c++23 -O2 -Wall -Wextra "'
            .. file
            .. '" -o "'
            .. exe
            .. '" && "'
            .. exe
            .. '"',
        true
    )
end, opts)

-- Huez Theme Manager
keymap.set("n", "<leader>th", ":Huez<CR>", opts)
keymap.set("n", "<leader>tf", ":HuezFavorites<CR>", opts)

-- Điều hướng thông minh giữa các Cửa sổ (Bao gồm cả Cửa sổ Terminal)
keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-j>", "<C-w>j", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)

keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], opts)
keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]], opts)
keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], opts)
keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], opts)

-- Competitive Programming (CompetiTest)
-- F7: Chọn ngôn ngữ và Tải bài từ Competitive Companion
keymap.set("n", "<F7>", function()
    vim.ui.select(
        { "cpp", "py" },
        { prompt = "Language Extension:" },
        function(choice)
            if not choice then return end
            
            require("competitest").setup({
                received_files_extension = choice,
            })
            
            vim.cmd("CompetiTest receive problem")
        end
    )
end, opts)

-- F8: Chạy thử toàn bộ các Testcase đã tải
keymap.set("n", "<F8>", function()
    vim.cmd("CompetiTest run")
end, opts)

-- Tự động nhảy vào thư mục làm bài Codeforces khi mở Neovim
vim.cmd([[cd E:\CompetitiveProgramming\CF]])