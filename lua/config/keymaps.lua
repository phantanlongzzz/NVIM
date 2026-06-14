local keymap = vim.keymap

-- ============================================================================
-- 1. QUẢN LÝ FILE & TÌM KIẾM (NvimTree & Telescope)
-- ============================================================================
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })

local builtin = require("telescope.builtin")
keymap.set("n", "<leader>ff", builtin.find_files, {})
keymap.set("n", "<leader>fg", builtin.live_grep, {})
keymap.set("n", "<leader>fb", builtin.buffers, {})

-- ============================================================================
-- 2. TERMINAL CHIA DỌC SANG PHẢI & CHẠY CODE
-- ============================================================================
local Terminal = require("toggleterm.terminal").Terminal

local main_term = Terminal:new({
    direction = "horizontal",
    hidden = true,
})

keymap.set("n", "<F4>", function()
    main_term:toggle()
end, { silent = true })



-- F5: Python
keymap.set("n", "<F5>", function()
    vim.cmd("w")

    local file = vim.fn.expand("%:p")

    main_term:open()
    main_term:send("python \"" .. file .. "\"", true)
end)

--F6 compile + run C++
keymap.set("n", "<F6>", function()
    vim.cmd("w")

    local file = vim.fn.expand("%:p")
    local exe = vim.fn.expand("%:r") .. ".exe"

    main_term:open()

    main_term:send(
        'g++ -std=c++23 -O2 -Wall -Wextra "'
            .. file
            .. '" -o "'
            .. exe
            .. '" && "'
            .. exe
            .. '"',
        true
    )
end)

-- ============================================================================
-- 3. ĐIỀU HƯỚNG NHANH GIỮA CÁC CỬA SỔ
-- ============================================================================
keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], { silent = true })
keymap.set("n", "<C-l>", "<C-w>l", { silent = true })

-- ============================================================================
-- 4. THEME
-- ============================================================================
keymap.set("n", "<leader>th", ":Huez<CR>", { silent = true })
keymap.set("n", "<leader>tf", ":HuezFavorites<CR>", { silent = true })

-- giữa terminal và editor
local opts = { silent = true }

keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-j>", "<C-w>j", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)

keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], opts)
keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]], opts)
keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], opts)
keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], opts)

